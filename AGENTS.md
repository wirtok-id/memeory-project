# AGENTS.md — Memeory AI Agent Definitions

> **Version:** 1.0.0  
> **Last Updated:** 2025  
> **Project:** Memeory — Relive the Internet's Funniest Memories

---

## Overview

Memeory uses a multi-agent AI architecture powered by the **Groq API** (using LLaMA 3.x / Mixtral models) to deliver real-time meme analysis, trend detection, explanation generation, and viral prediction. Each agent is a discrete, stateless microservice-style function that can be invoked independently or as part of a pipeline.

All agents communicate via Supabase Edge Functions and store their outputs in dedicated Supabase tables. Agents are designed to be:

- **Idempotent** — safe to re-run without side effects
- **Asynchronous** — non-blocking, queue-based execution
- **Observable** — every agent logs its run to `agent_logs` table
- **Composable** — agents can chain their outputs as inputs to other agents

---

## Agent Registry

| Agent ID | Agent Name | Trigger Type | Model | Frequency |
|---|---|---|---|---|
| `agent-001` | Trend Collector Agent | Scheduled (Cron) | External APIs | Every 6 hours |
| `agent-002` | Meme Analysis Agent | Event-driven | Groq LLaMA 3 | On meme upload/ingest |
| `agent-003` | Meme Explanation Agent | On-demand | Groq LLaMA 3 | User request |
| `agent-004` | Similarity Agent | Event-driven | Groq Embeddings | On meme ingest |
| `agent-005` | Viral Prediction Agent | Scheduled + On-demand | Groq Mixtral | Daily + User request |
| `agent-006` | Moderation Agent | Event-driven | Groq LLaMA 3 Guard | On every new meme |
| `agent-007` | Analytics Agent | Scheduled (Cron) | Groq Mixtral | Daily at 00:00 UTC |

---

## Agent Definitions

---

### Agent 001 — Trend Collector Agent

**Purpose:** Automatically discovers and ingests trending memes from external platforms into the Memeory database.

**Responsibilities:**
- Poll trending content from TikTok, YouTube Shorts, Reddit, and Twitter/X
- Deduplicate memes using perceptual hash (pHash) comparison
- Normalize metadata (title, tags, source URL, thumbnail, date)
- Insert raw meme records into `memes` table with `status = 'pending_analysis'`
- Track source metadata in `meme_sources` table

**Workflow:**

```
CRON TRIGGER (every 6h)
        │
        ▼
┌─────────────────────┐
│  Fetch Trending APIs │
│  - Reddit API        │
│  - YouTube Data API  │
│  - TikTok scraper    │
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│  Deduplication Check │
│  pHash + URL match   │
└─────────┬───────────┘
          │ new memes only
          ▼
┌─────────────────────┐
│  Normalize Metadata  │
│  + Tag Extraction    │
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│  Insert to Supabase  │
│  memes + sources     │
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│  Trigger Agent 002   │
│  (Meme Analysis)     │
└─────────────────────┘
```

**Input Schema:**
```json
{
  "sources": ["reddit", "youtube", "tiktok"],
  "limit_per_source": 50,
  "date_filter": "last_24h"
}
```

**Output Schema:**
```json
{
  "ingested_count": 42,
  "duplicate_count": 8,
  "failed_count": 2,
  "meme_ids": ["uuid1", "uuid2", "..."],
  "run_at": "2025-06-06T06:00:00Z"
}
```

**Error Handling:**
- API rate limit → exponential backoff (1s, 2s, 4s, max 3 retries)
- Network failure → mark job as `failed`, alert via Supabase notification
- Duplicate detection failure → log warning, skip insertion

**Environment Variables Required:**
```
REDDIT_CLIENT_ID
REDDIT_CLIENT_SECRET
YOUTUBE_API_KEY
TIKTOK_SCRAPER_ENDPOINT
```

---

### Agent 002 — Meme Analysis Agent

**Purpose:** Analyzes newly ingested memes to extract semantic metadata, classify categories, assign tags, and detect language/cultural context.

**Responsibilities:**
- Accept meme image URL or text content
- Use Groq vision-capable model to analyze visual content
- Extract: category, tags, text overlay, emotion, format (image/gif/video)
- Detect meme template (e.g., "Drake Pointing", "Distracted Boyfriend")
- Assign a `quality_score` (0–100) based on engagement signals
- Update meme record with enriched metadata

**Workflow:**

```
EVENT: meme inserted with status='pending_analysis'
        │
        ▼
┌─────────────────────────┐
│  Fetch meme media URL    │
│  Download thumbnail      │
└──────────┬──────────────┘
           │
           ▼
┌─────────────────────────┐
│  Groq Vision API Call   │
│  Prompt: analyze meme   │
│  template, text, emotion│
└──────────┬──────────────┘
           │
           ▼
┌─────────────────────────┐
│  Parse structured JSON  │
│  response from Groq      │
└──────────┬──────────────┘
           │
           ▼
┌─────────────────────────┐
│  Update memes table:     │
│  - category_id           │
│  - tags[]                │
│  - template_name         │
│  - quality_score         │
│  - status='active'       │
└──────────┬──────────────┘
           │
           ▼
┌─────────────────────────┐
│  Trigger Agent 004       │
│  (Similarity Agent)      │
└─────────────────────────┘
```

**Groq Prompt Template:**
```
You are a meme analysis expert. Analyze the following meme and return a JSON object with:
- "template_name": the known meme template name (string or null)
- "category": one of [humor, politics, gaming, sports, animals, entertainment, lifestyle, tech, other]
- "tags": array of 3–8 relevant tags (lowercase, no spaces)
- "text_content": any text visible in the meme
- "emotion": primary emotion conveyed [funny, ironic, relatable, wholesome, dark, cringe, inspiring]
- "quality_score": integer 0–100 based on clarity and engagement potential
- "language": detected language of text content (ISO 639-1 code)

Respond ONLY with valid JSON. No explanation.

Meme URL: {{meme_url}}
Meme Title: {{meme_title}}
```

**Output Schema:**
```json
{
  "meme_id": "uuid",
  "template_name": "Drake Pointing",
  "category": "humor",
  "tags": ["drake", "comparison", "preference", "relatable"],
  "text_content": "Using dark mode / Using light mode",
  "emotion": "relatable",
  "quality_score": 87,
  "language": "en",
  "analyzed_at": "2025-06-06T06:01:00Z"
}
```

---

### Agent 003 — Meme Explanation Agent

**Purpose:** Generates human-readable explanations of memes on user request, including origin story, cultural context, and why it became popular.

**Responsibilities:**
- Generate explanation in both English and Indonesian
- Provide: meaning, origin, cultural context, popularity reasons
- Cache explanation in `ai_explanations` table (TTL: 30 days)
- Return cached explanation if available within TTL

**Workflow:**

```
USER REQUEST: "Explain this meme"
        │
        ▼
┌─────────────────────────┐
│  Check ai_explanations   │
│  cache for meme_id       │
└──────────┬──────────────┘
           │
     ┌─────┴─────┐
  CACHE HIT   CACHE MISS
     │              │
     ▼              ▼
 Return         ┌─────────────────────────┐
 cached         │  Fetch meme metadata     │
 result         │  + template history      │
                └──────────┬──────────────┘
                           │
                           ▼
                ┌─────────────────────────┐
                │  Groq LLaMA 3 API Call  │
                │  Generate explanation   │
                │  in EN + ID             │
                └──────────┬──────────────┘
                           │
                           ▼
                ┌─────────────────────────┐
                │  Parse + validate        │
                │  structured response     │
                └──────────┬──────────────┘
                           │
                           ▼
                ┌─────────────────────────┐
                │  Store in               │
                │  ai_explanations table  │
                └──────────┬──────────────┘
                           │
                           ▼
                      Return to user
```

**Groq Prompt Template:**
```
You are an expert in internet culture and meme history. Explain the following meme comprehensively.

Meme Title: {{title}}
Meme Template: {{template_name}}
Tags: {{tags}}
Year: {{year}}
Source: {{source}}

Provide a JSON response with these exact fields:
- "meaning": Clear explanation of what the meme means (2–3 sentences)
- "origin": Where and when the meme originated (2–3 sentences)
- "cultural_context": Cultural or social context needed to understand it (2–3 sentences)
- "popularity_reasons": Why this meme became popular (2–3 sentences)
- "related_events": Any real-world events tied to this meme (1–2 sentences or null)

Generate the response in BOTH English and Indonesian.
Return format:
{
  "en": { "meaning": "", "origin": "", "cultural_context": "", "popularity_reasons": "", "related_events": "" },
  "id": { "meaning": "", "origin": "", "cultural_context": "", "popularity_reasons": "", "related_events": "" }
}
Respond ONLY with valid JSON.
```

**Output Schema:**
```json
{
  "meme_id": "uuid",
  "language": "en",
  "explanation": {
    "meaning": "This meme uses Drake...",
    "origin": "Originally from the 2015 music video...",
    "cultural_context": "The meme reflects a universal human behavior...",
    "popularity_reasons": "It became widely used because of its simplicity...",
    "related_events": null
  },
  "generated_at": "2025-06-06T10:00:00Z",
  "model_used": "llama3-70b-8192"
}
```

---

### Agent 004 — Similarity Agent

**Purpose:** Finds semantically similar memes using vector embeddings, enabling the "Similar Memes" feature.

**Responsibilities:**
- Generate vector embedding for each meme's metadata (title + tags + template + text)
- Store embeddings in Supabase `pgvector` extension column
- Perform cosine similarity search on demand
- Return top-N similar memes with similarity scores

**Workflow:**

```
EVENT: new meme analyzed (Agent 002 complete)
        │
        ▼
┌─────────────────────────────┐
│  Compose embedding input:    │
│  title + tags + template +  │
│  text_content + category    │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Generate embedding via      │
│  Groq / OpenAI Ada-002       │
│  (1536-dim vector)           │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Store in memes.embedding    │
│  (pgvector column)           │
└─────────────────────────────┘

ON USER REQUEST: "Find Similar"
        │
        ▼
┌─────────────────────────────┐
│  Fetch source meme embedding │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  pgvector cosine similarity  │
│  query: top 10 matches       │
│  threshold: > 0.75           │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Return meme_ids +          │
│  similarity_scores          │
└─────────────────────────────┘
```

**SQL Query (Supabase):**
```sql
SELECT id, title, thumbnail_url,
       1 - (embedding <=> $1::vector) AS similarity
FROM memes
WHERE id != $2
  AND status = 'active'
ORDER BY embedding <=> $1::vector
LIMIT 10;
```

---

### Agent 005 — Viral Prediction Agent

**Purpose:** Predicts whether a meme has the potential to go viral, using engagement signals and AI pattern recognition.

**Responsibilities:**
- Analyze view velocity, share rate, comment sentiment, cross-platform reach
- Use Groq to assess meme characteristics associated with virality
- Produce a `viral_score` (0–100) and `prediction` (low / medium / high / very_high)
- Store results in `viral_predictions` table
- Run daily batch predictions and on-demand user requests

**Workflow:**

```
DAILY CRON or USER REQUEST
        │
        ▼
┌─────────────────────────────┐
│  Gather meme signals:        │
│  - view_count (24h delta)   │
│  - bookmark_count           │
│  - cross_platform_count     │
│  - quality_score            │
│  - days_since_posted        │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Groq Mixtral Prompt:        │
│  Analyze virality potential  │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Parse viral_score (0–100)   │
│  + prediction category       │
│  + confidence (0.0–1.0)      │
│  + reasoning                 │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Store in viral_predictions  │
└─────────────────────────────┘
```

**Scoring Rubric:**

| Score | Prediction | Characteristics |
|---|---|---|
| 0–25 | Low | Low engagement, niche topic, poor quality |
| 26–50 | Medium | Moderate engagement, relatable but limited reach |
| 51–75 | High | Strong signals, trending template, good quality |
| 76–100 | Very High | Explosive growth, universal appeal, multi-platform |

---

### Agent 006 — Moderation Agent

**Purpose:** Automatically screens all incoming memes for policy violations, hate speech, NSFW content, and copyright issues.

**Responsibilities:**
- Screen every new meme before it becomes `active`
- Detect: hate speech, explicit content, violence, copyright watermarks
- Assign moderation status: `approved`, `flagged`, `rejected`
- Provide moderation reason for rejected/flagged content
- Support human review queue for `flagged` items

**Workflow:**

```
EVENT: meme inserted (status='pending_moderation')
        │
        ▼
┌─────────────────────────────┐
│  Groq LLaMA Guard API       │
│  Check content policy       │
└──────────┬──────────────────┘
           │
    ┌──────┴──────────┐
 APPROVED           FLAGGED / REJECTED
    │                    │
    ▼                    ▼
Update status=     Add to moderation
'pending_analysis' review queue +
(→ Agent 002)      notify admin
```

**Moderation Categories:**

| Category | Action | Threshold |
|---|---|---|
| Hate speech | Reject | Any detection |
| Explicit/NSFW | Reject | Any detection |
| Violence/gore | Reject | Any detection |
| Mild profanity | Flag | Moderate+ |
| Copyright claim | Flag | Watermark detected |
| Spam/low quality | Flag | Quality score < 10 |
| Political sensitivity | Flag | Context-dependent |

---

### Agent 007 — Analytics Agent

**Purpose:** Generates daily trend summaries, meme performance reports, and category insights.

**Responsibilities:**
- Aggregate daily meme view stats, bookmark counts, search queries
- Identify top trending memes per category
- Generate natural language trend summary (EN + ID)
- Store in `trend_reports` table
- Detect emerging trends before they peak

**Workflow:**

```
DAILY CRON at 00:00 UTC
        │
        ▼
┌─────────────────────────────┐
│  Aggregate Supabase stats:   │
│  - Top 10 memes by views    │
│  - Top categories           │
│  - Search query trends      │
│  - New memes ingested        │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Groq Mixtral:               │
│  Generate trend narrative   │
│  in EN + ID                  │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Store in trend_reports      │
│  Publish to app dashboard   │
└─────────────────────────────┘
```

**Output Example:**
```json
{
  "report_date": "2025-06-06",
  "summary": {
    "en": "Today's meme landscape is dominated by gaming culture...",
    "id": "Lanskap meme hari ini didominasi oleh budaya gaming..."
  },
  "top_memes": ["uuid1", "uuid2", "uuid3"],
  "trending_categories": ["gaming", "tech", "animals"],
  "emerging_trends": ["AI memes", "WWDC reactions"],
  "total_memes_ingested": 156,
  "total_views": 48320
}
```

---

## Agent Communication Protocol

```
                    ┌─────────────────────────┐
                    │   Supabase Realtime DB   │
                    │   (Postgres + pgvector)  │
                    └────────────┬────────────┘
                                 │ triggers / polls
          ┌──────────────────────┼──────────────────────┐
          │                      │                      │
   ┌──────▼──────┐       ┌───────▼──────┐      ┌───────▼──────┐
   │  Agent 001  │       │  Agent 006   │      │  Agent 007   │
   │  Trend      │──────▶│  Moderation  │      │  Analytics   │
   │  Collector  │       └───────┬──────┘      └──────────────┘
   └─────────────┘               │ approved
                                 ▼
                         ┌───────────────┐
                         │   Agent 002   │
                         │   Analysis    │
                         └───────┬───────┘
                      ┌──────────┼──────────┐
                      │          │          │
               ┌──────▼──┐ ┌────▼────┐ ┌───▼──────┐
               │Agent 003│ │Agent 004│ │Agent 005 │
               │Explain  │ │Similar  │ │Viral     │
               └─────────┘ └─────────┘ └──────────┘
```

---

## Agent Logging Schema

All agents write to the `agent_logs` table:

```sql
agent_logs (
  id           UUID PRIMARY KEY,
  agent_id     TEXT NOT NULL,          -- e.g. 'agent-001'
  run_id       UUID NOT NULL,          -- unique per invocation
  status       TEXT,                   -- 'running' | 'success' | 'failed'
  input        JSONB,
  output       JSONB,
  error        TEXT,
  duration_ms  INTEGER,
  started_at   TIMESTAMPTZ,
  completed_at TIMESTAMPTZ
)
```

---

## Deployment

All agents are deployed as **Supabase Edge Functions** (Deno runtime):

```
supabase/functions/
├── agent-trend-collector/     index.ts
├── agent-meme-analysis/       index.ts
├── agent-meme-explanation/    index.ts
├── agent-similarity/          index.ts
├── agent-viral-prediction/    index.ts
├── agent-moderation/          index.ts
└── agent-analytics/           index.ts
```

Cron jobs configured in `supabase/config.toml`:
```toml
[functions.agent-trend-collector]
schedule = "0 */6 * * *"

[functions.agent-analytics]
schedule = "0 0 * * *"

[functions.agent-viral-prediction]
schedule = "0 12 * * *"
```
