# DATABASE_SCHEMA.md — Memeory Database Design

> **Database:** PostgreSQL 15 (via Supabase)  
> **Extensions:** `pgvector`, `pg_trgm`, `uuid-ossp`  
> **Version:** 1.0.0

---

## Overview

```
auth.users (Supabase built-in)
     │
     ▼
  profiles ──────────────────────────┐
     │                               │
     ▼                               ▼
bookmarks                         (user_id FK)
     │
     ▼
   memes ──────── meme_categories
     │      │
     │      ├─── meme_tag_relations ──── meme_tags
     │      │
     │      ├─── meme_sources
     │      │
     │      ├─── meme_views
     │      │
     │      ├─── ai_explanations
     │      │
     │      ├─── viral_predictions
     │      │
     │      └─── trend_report_memes ──── trend_reports
     │
     └─── agent_logs
```

---

## Extensions Setup

```sql
-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgvector";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";
CREATE EXTENSION IF NOT EXISTS "unaccent";
```

---

## Table Definitions

---

### Table: `profiles`

Extends Supabase's built-in `auth.users` table with application-specific user data.

```sql
CREATE TABLE profiles (
  -- Primary Key
  id                UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,

  -- Identity
  username          TEXT UNIQUE NOT NULL CHECK (
                      length(username) >= 3 AND
                      length(username) <= 30 AND
                      username ~ '^[a-zA-Z0-9_]+$'
                    ),
  display_name      TEXT CHECK (length(display_name) <= 60),
  avatar_url        TEXT,
  bio               TEXT CHECK (length(bio) <= 300),

  -- Preferences
  preferred_locale  TEXT NOT NULL DEFAULT 'id' CHECK (preferred_locale IN ('en', 'id')),
  theme_preference  TEXT NOT NULL DEFAULT 'system' CHECK (theme_preference IN ('light', 'dark', 'system')),

  -- Stats (denormalized for performance)
  bookmark_count    INTEGER NOT NULL DEFAULT 0 CHECK (bookmark_count >= 0),
  meme_views_count  INTEGER NOT NULL DEFAULT 0 CHECK (meme_views_count >= 0),

  -- Roles
  role              TEXT NOT NULL DEFAULT 'user' CHECK (role IN ('user', 'moderator', 'admin')),
  is_verified       BOOLEAN NOT NULL DEFAULT FALSE,
  is_banned         BOOLEAN NOT NULL DEFAULT FALSE,

  -- Timestamps
  created_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_profiles_username ON profiles(username);
CREATE INDEX idx_profiles_role ON profiles(role);
CREATE INDEX idx_profiles_created_at ON profiles(created_at DESC);

-- Auto-update updated_at
CREATE TRIGGER set_profiles_updated_at
  BEFORE UPDATE ON profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Auto-create profile on auth.users insert
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO profiles (id, username, display_name, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(
      NEW.raw_user_meta_data->>'username',
      LOWER(SPLIT_PART(NEW.email, '@', 1)) || '_' || SUBSTR(NEW.id::text, 1, 4)
    ),
    COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.raw_user_meta_data->>'name'),
    NEW.raw_user_meta_data->>'avatar_url'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();
```

**RLS Policies:**
```sql
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Anyone can view public profiles
CREATE POLICY "profiles_select_public" ON profiles
  FOR SELECT USING (true);

-- Users can only update their own profile
CREATE POLICY "profiles_update_own" ON profiles
  FOR UPDATE USING (auth.uid() = id);

-- Only system (trigger) can insert
CREATE POLICY "profiles_insert_system" ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);
```

---

### Table: `meme_categories`

```sql
CREATE TABLE meme_categories (
  id          SERIAL PRIMARY KEY,
  slug        TEXT UNIQUE NOT NULL,
  name_en     TEXT NOT NULL,
  name_id     TEXT NOT NULL,
  icon        TEXT,                   -- emoji or icon name
  color_hex   TEXT,                   -- accent color for UI
  sort_order  INTEGER NOT NULL DEFAULT 0,
  is_active   BOOLEAN NOT NULL DEFAULT TRUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Seed data
INSERT INTO meme_categories (slug, name_en, name_id, icon, color_hex, sort_order) VALUES
  ('humor',         'Humor',         'Humor',        '😂', '#F59E0B', 1),
  ('gaming',        'Gaming',        'Gaming',       '🎮', '#8B5CF6', 2),
  ('politics',      'Politics',      'Politik',      '🗳️', '#EF4444', 3),
  ('sports',        'Sports',        'Olahraga',     '⚽', '#10B981', 4),
  ('animals',       'Animals',       'Hewan',        '🐱', '#F97316', 5),
  ('entertainment', 'Entertainment', 'Hiburan',      '🎬', '#EC4899', 6),
  ('lifestyle',     'Lifestyle',     'Gaya Hidup',   '✨', '#06B6D4', 7),
  ('tech',          'Technology',    'Teknologi',    '💻', '#3B82F6', 8),
  ('relatable',     'Relatable',     'Relatable',    '🙃', '#84CC16', 9),
  ('other',         'Other',         'Lainnya',      '🌐', '#6B7280', 10);
```

---

### Table: `meme_tags`

```sql
CREATE TABLE meme_tags (
  id          SERIAL PRIMARY KEY,
  slug        TEXT UNIQUE NOT NULL CHECK (slug ~ '^[a-z0-9\-]+$'),
  name        TEXT NOT NULL,
  usage_count INTEGER NOT NULL DEFAULT 0,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_meme_tags_slug ON meme_tags(slug);
CREATE INDEX idx_meme_tags_usage ON meme_tags(usage_count DESC);
CREATE INDEX idx_meme_tags_name_trgm ON meme_tags USING GIN (name gin_trgm_ops);
```

---

### Table: `memes`

The core table. Stores all meme metadata and AI-enriched fields.

```sql
CREATE TABLE memes (
  -- Primary Key
  id                UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

  -- Content
  title             TEXT NOT NULL CHECK (length(title) >= 2 AND length(title) <= 300),
  slug              TEXT UNIQUE NOT NULL,
  description       TEXT CHECK (length(description) <= 1000),
  thumbnail_url     TEXT NOT NULL,
  media_url         TEXT,                     -- original media (image/gif/video)
  media_type        TEXT NOT NULL DEFAULT 'image' CHECK (
                      media_type IN ('image', 'gif', 'video', 'text')
                    ),

  -- Classification
  category_id       INTEGER REFERENCES meme_categories(id) ON DELETE SET NULL,
  template_name     TEXT,                     -- e.g. "Drake Pointing", "Distracted Boyfriend"

  -- AI-Enriched Fields
  text_content      TEXT,                     -- text visible in the meme
  emotion           TEXT CHECK (
                      emotion IN ('funny', 'ironic', 'relatable', 'wholesome', 'dark', 'cringe', 'inspiring', 'other')
                    ),
  quality_score     SMALLINT CHECK (quality_score BETWEEN 0 AND 100),
  language          TEXT DEFAULT 'en',        -- ISO 639-1 code

  -- Temporal
  original_date     DATE,                     -- when the meme originated
  year              SMALLINT GENERATED ALWAYS AS (EXTRACT(YEAR FROM original_date)::SMALLINT) STORED,
  ingested_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  -- Engagement (denormalized counters for performance)
  view_count        INTEGER NOT NULL DEFAULT 0 CHECK (view_count >= 0),
  bookmark_count    INTEGER NOT NULL DEFAULT 0 CHECK (bookmark_count >= 0),
  share_count       INTEGER NOT NULL DEFAULT 0 CHECK (share_count >= 0),

  -- Trending
  is_trending       BOOLEAN NOT NULL DEFAULT FALSE,
  trending_rank     INTEGER,
  trending_score    NUMERIC(10,4),
  last_trended_at   TIMESTAMPTZ,

  -- Status & Moderation
  status            TEXT NOT NULL DEFAULT 'pending_moderation' CHECK (
                      status IN ('pending_moderation', 'pending_analysis', 'active', 'flagged', 'rejected', 'archived')
                    ),
  moderation_notes  TEXT,

  -- Vector Embedding for Similarity Search
  embedding         vector(1536),             -- OpenAI/Groq embedding dimensions

  -- Full-text Search
  search_vector     TSVECTOR GENERATED ALWAYS AS (
                      to_tsvector('english', COALESCE(title, '') || ' ' ||
                      COALESCE(description, '') || ' ' ||
                      COALESCE(text_content, '') || ' ' ||
                      COALESCE(template_name, ''))
                    ) STORED,

  -- Metadata
  source_url        TEXT,
  is_admin_curated  BOOLEAN NOT NULL DEFAULT FALSE,
  created_by        UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_memes_status ON memes(status) WHERE status = 'active';
CREATE INDEX idx_memes_year ON memes(year) WHERE status = 'active';
CREATE INDEX idx_memes_original_date ON memes(original_date DESC) WHERE status = 'active';
CREATE INDEX idx_memes_category ON memes(category_id) WHERE status = 'active';
CREATE INDEX idx_memes_trending ON memes(trending_rank ASC NULLS LAST) WHERE is_trending = TRUE;
CREATE INDEX idx_memes_quality ON memes(quality_score DESC) WHERE status = 'active';
CREATE INDEX idx_memes_view_count ON memes(view_count DESC) WHERE status = 'active';
CREATE INDEX idx_memes_ingested ON memes(ingested_at DESC);
CREATE INDEX idx_memes_search ON memes USING GIN(search_vector);
CREATE INDEX idx_memes_title_trgm ON memes USING GIN(title gin_trgm_ops);
CREATE INDEX idx_memes_embedding ON memes USING ivfflat(embedding vector_cosine_ops) WITH (lists = 100);
CREATE INDEX idx_memes_slug ON memes(slug);

-- Auto-update updated_at
CREATE TRIGGER set_memes_updated_at
  BEFORE UPDATE ON memes
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
```

**RLS Policies:**
```sql
ALTER TABLE memes ENABLE ROW LEVEL SECURITY;

-- Anyone can view active memes
CREATE POLICY "memes_select_active" ON memes
  FOR SELECT USING (status = 'active');

-- Admins can view all memes
CREATE POLICY "memes_select_admin" ON memes
  FOR SELECT USING (
    auth.uid() IN (SELECT id FROM profiles WHERE role IN ('admin', 'moderator'))
  );

-- Only admins/service role can insert
CREATE POLICY "memes_insert_admin" ON memes
  FOR INSERT WITH CHECK (
    auth.uid() IN (SELECT id FROM profiles WHERE role = 'admin')
  );

-- Only admins can update
CREATE POLICY "memes_update_admin" ON memes
  FOR UPDATE USING (
    auth.uid() IN (SELECT id FROM profiles WHERE role IN ('admin', 'moderator'))
  );
```

---

### Table: `meme_tag_relations`

Many-to-many junction table for memes and tags.

```sql
CREATE TABLE meme_tag_relations (
  meme_id     UUID NOT NULL REFERENCES memes(id) ON DELETE CASCADE,
  tag_id      INTEGER NOT NULL REFERENCES meme_tags(id) ON DELETE CASCADE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (meme_id, tag_id)
);

CREATE INDEX idx_meme_tag_relations_meme ON meme_tag_relations(meme_id);
CREATE INDEX idx_meme_tag_relations_tag ON meme_tag_relations(tag_id);
```

---

### Table: `meme_sources`

Tracks which platforms and URLs a meme was found on.

```sql
CREATE TABLE meme_sources (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  meme_id         UUID NOT NULL REFERENCES memes(id) ON DELETE CASCADE,

  platform        TEXT NOT NULL CHECK (
                    platform IN ('reddit', 'tiktok', 'youtube', 'twitter', 'instagram', 'admin', 'other')
                  ),
  source_url      TEXT NOT NULL,
  source_id       TEXT,                      -- platform-specific post ID
  source_author   TEXT,                      -- username on source platform
  source_title    TEXT,
  engagement      JSONB DEFAULT '{}',        -- {upvotes, comments, shares, views}
  discovered_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  UNIQUE(meme_id, platform, source_id)
);

CREATE INDEX idx_meme_sources_meme ON meme_sources(meme_id);
CREATE INDEX idx_meme_sources_platform ON meme_sources(platform);
CREATE INDEX idx_meme_sources_discovered ON meme_sources(discovered_at DESC);
```

---

### Table: `meme_views`

Tracks individual meme view events (write-optimized).

```sql
CREATE TABLE meme_views (
  id          BIGSERIAL PRIMARY KEY,
  meme_id     UUID NOT NULL REFERENCES memes(id) ON DELETE CASCADE,
  user_id     UUID REFERENCES auth.users(id) ON DELETE SET NULL,  -- NULL for anonymous
  session_id  TEXT,                          -- anonymous session tracking
  ip_hash     TEXT,                          -- hashed IP for dedup
  viewed_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
) PARTITION BY RANGE (viewed_at);

-- Monthly partitions (create for each month)
CREATE TABLE meme_views_2025_01 PARTITION OF meme_views
  FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');
-- ... (create partitions for each month)

CREATE INDEX idx_meme_views_meme_id ON meme_views(meme_id);
CREATE INDEX idx_meme_views_viewed_at ON meme_views(viewed_at DESC);
CREATE INDEX idx_meme_views_user_id ON meme_views(user_id) WHERE user_id IS NOT NULL;
```

**RLS Policies:**
```sql
ALTER TABLE meme_views ENABLE ROW LEVEL SECURITY;

-- Authenticated users can insert their own views
CREATE POLICY "meme_views_insert_auth" ON meme_views
  FOR INSERT WITH CHECK (auth.uid() = user_id OR user_id IS NULL);

-- Users can see their own views
CREATE POLICY "meme_views_select_own" ON meme_views
  FOR SELECT USING (auth.uid() = user_id);
```

---

### Table: `bookmarks`

```sql
CREATE TABLE bookmarks (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id     UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  meme_id     UUID NOT NULL REFERENCES memes(id) ON DELETE CASCADE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  UNIQUE(user_id, meme_id)
);

CREATE INDEX idx_bookmarks_user ON bookmarks(user_id, created_at DESC);
CREATE INDEX idx_bookmarks_meme ON bookmarks(meme_id);
```

**RLS Policies:**
```sql
ALTER TABLE bookmarks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "bookmarks_select_own" ON bookmarks
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "bookmarks_insert_own" ON bookmarks
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "bookmarks_delete_own" ON bookmarks
  FOR DELETE USING (auth.uid() = user_id);
```

---

### Table: `ai_explanations`

Caches AI-generated explanations to avoid redundant API calls.

```sql
CREATE TABLE ai_explanations (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  meme_id         UUID NOT NULL REFERENCES memes(id) ON DELETE CASCADE,

  -- Bilingual content
  meaning_en      TEXT NOT NULL,
  origin_en       TEXT NOT NULL,
  cultural_context_en  TEXT NOT NULL,
  popularity_reasons_en TEXT NOT NULL,
  related_events_en     TEXT,

  meaning_id      TEXT NOT NULL,
  origin_id       TEXT NOT NULL,
  cultural_context_id  TEXT NOT NULL,
  popularity_reasons_id TEXT NOT NULL,
  related_events_id     TEXT,

  -- Quality
  thumbs_up       INTEGER NOT NULL DEFAULT 0,
  thumbs_down     INTEGER NOT NULL DEFAULT 0,

  -- AI Metadata
  model_used      TEXT NOT NULL,
  prompt_version  TEXT NOT NULL DEFAULT '1.0',
  tokens_used     INTEGER,

  -- Cache control
  generated_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  expires_at      TIMESTAMPTZ NOT NULL DEFAULT (NOW() + INTERVAL '30 days'),

  UNIQUE(meme_id)
);

CREATE INDEX idx_ai_explanations_meme ON ai_explanations(meme_id);
CREATE INDEX idx_ai_explanations_expires ON ai_explanations(expires_at);
```

**RLS Policies:**
```sql
ALTER TABLE ai_explanations ENABLE ROW LEVEL SECURITY;

-- Anyone can read explanations
CREATE POLICY "ai_explanations_select_all" ON ai_explanations
  FOR SELECT USING (true);

-- Only service role can insert/update (via Edge Functions)
CREATE POLICY "ai_explanations_insert_service" ON ai_explanations
  FOR INSERT WITH CHECK (auth.role() = 'service_role');

CREATE POLICY "ai_explanations_update_service" ON ai_explanations
  FOR UPDATE USING (auth.role() = 'service_role');
```

---

### Table: `viral_predictions`

```sql
CREATE TABLE viral_predictions (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  meme_id         UUID NOT NULL REFERENCES memes(id) ON DELETE CASCADE,

  -- Prediction
  viral_score     SMALLINT NOT NULL CHECK (viral_score BETWEEN 0 AND 100),
  prediction      TEXT NOT NULL CHECK (
                    prediction IN ('low', 'medium', 'high', 'very_high')
                  ),
  confidence      NUMERIC(3,2) CHECK (confidence BETWEEN 0.0 AND 1.0),
  reasoning_en    TEXT,
  reasoning_id    TEXT,

  -- Input signals used
  signals         JSONB NOT NULL DEFAULT '{}', -- {view_velocity, bookmark_rate, etc.}

  -- Metadata
  model_used      TEXT NOT NULL,
  predicted_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  valid_until     TIMESTAMPTZ NOT NULL DEFAULT (NOW() + INTERVAL '24 hours')
);

CREATE INDEX idx_viral_predictions_meme ON viral_predictions(meme_id);
CREATE INDEX idx_viral_predictions_score ON viral_predictions(viral_score DESC);
CREATE INDEX idx_viral_predictions_predicted ON viral_predictions(predicted_at DESC);
```

**RLS:**
```sql
ALTER TABLE viral_predictions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "viral_predictions_select_all" ON viral_predictions
  FOR SELECT USING (true);

CREATE POLICY "viral_predictions_manage_service" ON viral_predictions
  FOR ALL USING (auth.role() = 'service_role');
```

---

### Table: `trend_reports`

Daily AI-generated trend summaries.

```sql
CREATE TABLE trend_reports (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  report_date     DATE NOT NULL UNIQUE,

  -- Summary content
  summary_en      TEXT NOT NULL,
  summary_id      TEXT NOT NULL,

  -- Report data
  top_meme_ids    UUID[] NOT NULL DEFAULT '{}',
  trending_categories TEXT[] NOT NULL DEFAULT '{}',
  emerging_trends TEXT[] NOT NULL DEFAULT '{}',

  -- Stats
  total_memes_ingested  INTEGER NOT NULL DEFAULT 0,
  total_views           BIGINT NOT NULL DEFAULT 0,
  new_trending_count    INTEGER NOT NULL DEFAULT 0,

  -- Metadata
  model_used      TEXT NOT NULL,
  generated_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_trend_reports_date ON trend_reports(report_date DESC);
```

---

### Table: `agent_logs`

Operational logs for all AI agents.

```sql
CREATE TABLE agent_logs (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  agent_id        TEXT NOT NULL,         -- e.g. 'agent-001'
  run_id          UUID NOT NULL DEFAULT uuid_generate_v4(),
  status          TEXT NOT NULL CHECK (status IN ('running', 'success', 'failed', 'partial')),
  trigger_type    TEXT CHECK (trigger_type IN ('cron', 'event', 'manual')),
  input           JSONB,
  output          JSONB,
  error_message   TEXT,
  duration_ms     INTEGER,
  items_processed INTEGER DEFAULT 0,
  started_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at    TIMESTAMPTZ
);

CREATE INDEX idx_agent_logs_agent ON agent_logs(agent_id, started_at DESC);
CREATE INDEX idx_agent_logs_status ON agent_logs(status) WHERE status = 'failed';
CREATE INDEX idx_agent_logs_started ON agent_logs(started_at DESC);
```

---

## Utility Functions

```sql
-- Shared updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Increment meme view count (called by client)
CREATE OR REPLACE FUNCTION increment_meme_view(p_meme_id UUID)
RETURNS void AS $$
BEGIN
  UPDATE memes SET view_count = view_count + 1 WHERE id = p_meme_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Vector similarity search
CREATE OR REPLACE FUNCTION search_similar_memes(
  p_meme_id UUID,
  p_limit INTEGER DEFAULT 10,
  p_threshold FLOAT DEFAULT 0.75
)
RETURNS TABLE(id UUID, title TEXT, thumbnail_url TEXT, similarity FLOAT) AS $$
BEGIN
  RETURN QUERY
  SELECT
    m.id,
    m.title,
    m.thumbnail_url,
    (1 - (m.embedding <=> source.embedding))::FLOAT AS similarity
  FROM memes m,
       (SELECT embedding FROM memes WHERE id = p_meme_id) source
  WHERE m.id != p_meme_id
    AND m.status = 'active'
    AND m.embedding IS NOT NULL
    AND 1 - (m.embedding <=> source.embedding) >= p_threshold
  ORDER BY m.embedding <=> source.embedding
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;

-- Full-text + filter meme search
CREATE OR REPLACE FUNCTION search_memes(
  p_query TEXT DEFAULT NULL,
  p_category_id INTEGER DEFAULT NULL,
  p_year INTEGER DEFAULT NULL,
  p_year_from INTEGER DEFAULT NULL,
  p_year_to INTEGER DEFAULT NULL,
  p_tags TEXT[] DEFAULT NULL,
  p_is_trending BOOLEAN DEFAULT NULL,
  p_sort TEXT DEFAULT 'relevance',
  p_cursor UUID DEFAULT NULL,
  p_limit INTEGER DEFAULT 20
)
RETURNS TABLE(
  id UUID, title TEXT, thumbnail_url TEXT, year SMALLINT,
  view_count INTEGER, is_trending BOOLEAN, quality_score SMALLINT,
  category_slug TEXT, rank REAL
) AS $$
BEGIN
  RETURN QUERY
  SELECT DISTINCT ON (
    CASE WHEN p_sort = 'relevance' AND p_query IS NOT NULL
      THEN ts_rank(m.search_vector, plainto_tsquery('english', p_query))::REAL
      ELSE 0.0::REAL
    END
  )
    m.id, m.title, m.thumbnail_url, m.year,
    m.view_count, m.is_trending, m.quality_score,
    c.slug AS category_slug,
    COALESCE(ts_rank(m.search_vector, plainto_tsquery('english', p_query)), 0.5)::REAL AS rank
  FROM memes m
  LEFT JOIN meme_categories c ON m.category_id = c.id
  LEFT JOIN meme_tag_relations mtr ON m.id = mtr.meme_id
  LEFT JOIN meme_tags mt ON mtr.tag_id = mt.id
  WHERE m.status = 'active'
    AND (p_query IS NULL OR m.search_vector @@ plainto_tsquery('english', p_query))
    AND (p_category_id IS NULL OR m.category_id = p_category_id)
    AND (p_year IS NULL OR m.year = p_year)
    AND (p_year_from IS NULL OR m.year >= p_year_from)
    AND (p_year_to IS NULL OR m.year <= p_year_to)
    AND (p_tags IS NULL OR mt.slug = ANY(p_tags))
    AND (p_is_trending IS NULL OR m.is_trending = p_is_trending)
  ORDER BY
    CASE p_sort
      WHEN 'newest' THEN EXTRACT(EPOCH FROM m.original_date)::REAL
      WHEN 'most_viewed' THEN m.view_count::REAL
      WHEN 'quality' THEN m.quality_score::REAL
      ELSE COALESCE(ts_rank(m.search_vector, plainto_tsquery('english', p_query)), 0.5)::REAL
    END DESC
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;

-- Get timeline memes
CREATE OR REPLACE FUNCTION get_timeline_memes(
  p_years_ago INTEGER,
  p_limit INTEGER DEFAULT 10
)
RETURNS SETOF memes AS $$
DECLARE
  target_date DATE;
BEGIN
  target_date := CURRENT_DATE - (p_years_ago || ' years')::INTERVAL;
  RETURN QUERY
  SELECT * FROM memes
  WHERE status = 'active'
    AND original_date BETWEEN (target_date - INTERVAL '3 days') AND (target_date + INTERVAL '3 days')
  ORDER BY view_count DESC, quality_score DESC
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;
```

---

## Entity Relationship Summary

| Table | PK Type | FK References | Estimated Rows |
|---|---|---|---|
| `profiles` | UUID | `auth.users` | 50K–1M |
| `meme_categories` | SERIAL | — | 10–20 |
| `meme_tags` | SERIAL | — | 500–5,000 |
| `memes` | UUID | `meme_categories`, `auth.users` | 100K–10M |
| `meme_tag_relations` | Composite | `memes`, `meme_tags` | 500K–50M |
| `meme_sources` | UUID | `memes` | 200K–20M |
| `meme_views` | BIGSERIAL | `memes`, `auth.users` | 10M+ (partitioned) |
| `bookmarks` | UUID | `auth.users`, `memes` | 500K–5M |
| `ai_explanations` | UUID | `memes` | 100K–10M |
| `viral_predictions` | UUID | `memes` | 100K–5M |
| `trend_reports` | UUID | — | 365 (per year) |
| `agent_logs` | UUID | — | 10K+ (pruned) |
