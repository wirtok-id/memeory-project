# API_SPEC.md — Memeory API Specification

> **Version:** 1.0.0  
> **Base URL:** `https://your-project.supabase.co`  
> **Edge Functions Base:** `https://your-project.supabase.co/functions/v1`  
> **Auth:** Supabase JWT (Bearer token in `Authorization` header)

---

## General Conventions

### Request Headers

```http
Authorization: Bearer <supabase_jwt_token>
Content-Type: application/json
Accept-Language: id   # or 'en'
X-Client-Version: 1.0.0
```

### Standard Response Envelope

```json
{
  "data": { },
  "error": null,
  "meta": {
    "request_id": "req_abc123",
    "timestamp": "2025-06-06T10:00:00Z"
  }
}
```

### Error Response

```json
{
  "data": null,
  "error": {
    "code": "MEME_NOT_FOUND",
    "message": "The requested meme does not exist.",
    "message_id": "error.meme_not_found",
    "status": 404
  }
}
```

### Error Codes

| Code | HTTP | Description |
|---|---|---|
| `UNAUTHORIZED` | 401 | Missing or invalid JWT |
| `FORBIDDEN` | 403 | Insufficient permissions |
| `NOT_FOUND` | 404 | Resource not found |
| `VALIDATION_ERROR` | 422 | Invalid input parameters |
| `RATE_LIMITED` | 429 | Rate limit exceeded |
| `AI_UNAVAILABLE` | 503 | Groq API temporarily unavailable |
| `INTERNAL_ERROR` | 500 | Unexpected server error |

### Pagination (Cursor-based)

```json
{
  "data": [...],
  "pagination": {
    "has_more": true,
    "next_cursor": "uuid-of-last-item",
    "total_count": 1432,
    "limit": 20
  }
}
```

---

## 1. Auth APIs

All auth operations use **Supabase Auth REST API**.

---

### POST /auth/v1/signup

Register with email and password.

**Request:**
```http
POST https://your-project.supabase.co/auth/v1/signup
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "StrongP@ss123",
  "data": {
    "username": "memefan99",
    "full_name": "Reza Pratama",
    "preferred_locale": "id"
  }
}
```

**Response 200:**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "bearer",
  "expires_in": 3600,
  "refresh_token": "long-refresh-token-here",
  "user": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "email_confirmed_at": null,
    "created_at": "2025-06-06T10:00:00Z",
    "user_metadata": {
      "username": "memefan99",
      "full_name": "Reza Pratama"
    }
  }
}
```

---

### POST /auth/v1/token?grant_type=password

Login with email and password.

**Request:**
```http
POST https://your-project.supabase.co/auth/v1/token?grant_type=password
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "StrongP@ss123"
}
```

**Response 200:**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "bearer",
  "expires_in": 3600,
  "refresh_token": "long-refresh-token-here",
  "user": { "id": "uuid", "email": "user@example.com" }
}
```

---

### POST /auth/v1/token?grant_type=refresh_token

Refresh access token.

**Request:**
```json
{ "refresh_token": "your-refresh-token" }
```

---

### POST /auth/v1/recover

Request password reset email.

**Request:**
```json
{ "email": "user@example.com" }
```

---

### DELETE /auth/v1/logout

Logout and invalidate session.

**Headers:** `Authorization: Bearer <token>`

---

## 2. Profile APIs

Served via Supabase PostgREST.

---

### GET /rest/v1/profiles?id=eq.{user_id}

Get user profile.

**Response 200:**
```json
[{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "username": "memefan99",
  "display_name": "Reza Pratama",
  "avatar_url": "https://cdn.memeory.app/avatars/uuid.jpg",
  "bio": "Meme enthusiast 🐸",
  "preferred_locale": "id",
  "theme_preference": "dark",
  "bookmark_count": 42,
  "role": "user",
  "created_at": "2025-06-06T10:00:00Z"
}]
```

---

### PATCH /rest/v1/profiles?id=eq.{user_id}

Update own profile.

**Headers:** `Authorization: Bearer <token>`

**Request:**
```json
{
  "display_name": "Reza P.",
  "bio": "Certified meme historian 🎓",
  "preferred_locale": "en",
  "theme_preference": "dark"
}
```

---

## 3. Meme APIs

---

### GET /rest/v1/memes

List memes with filtering.

**Query Parameters:**

| Param | Type | Description | Example |
|---|---|---|---|
| `status` | string | Filter by status | `eq.active` |
| `year` | integer | Filter by year | `eq.2023` |
| `category_id` | integer | Filter by category | `eq.2` |
| `is_trending` | boolean | Only trending | `eq.true` |
| `order` | string | Sort order | `view_count.desc` |
| `limit` | integer | Page size (max 50) | `20` |
| `offset` | integer | Pagination offset | `0` |

**Request:**
```http
GET /rest/v1/memes?status=eq.active&is_trending=eq.true&order=trending_rank.asc&limit=20
Authorization: Bearer <token>
```

**Response 200:**
```json
[
  {
    "id": "550e8400-e29b-41d4-a716-446655440001",
    "title": "Me checking the fridge at 3am",
    "slug": "me-checking-fridge-3am-2024",
    "thumbnail_url": "https://cdn.memeory.app/thumbnails/uuid.webp",
    "media_type": "image",
    "year": 2024,
    "original_date": "2024-06-01",
    "view_count": 48320,
    "bookmark_count": 1204,
    "is_trending": true,
    "trending_rank": 3,
    "quality_score": 87,
    "emotion": "relatable",
    "template_name": "Hungry Cat",
    "category_id": 1,
    "language": "en"
  }
]
```

---

### GET /rest/v1/memes?id=eq.{meme_id}

Get single meme by ID.

**Response 200:**
```json
[{
  "id": "550e8400-e29b-41d4-a716-446655440001",
  "title": "Me checking the fridge at 3am",
  "slug": "me-checking-fridge-3am-2024",
  "description": "Classic late night hunger relatable meme",
  "thumbnail_url": "https://cdn.memeory.app/thumbnails/uuid.webp",
  "media_url": "https://cdn.memeory.app/media/uuid.gif",
  "media_type": "image",
  "year": 2024,
  "original_date": "2024-06-01",
  "view_count": 48320,
  "bookmark_count": 1204,
  "share_count": 3201,
  "is_trending": true,
  "trending_rank": 3,
  "quality_score": 87,
  "emotion": "relatable",
  "template_name": "Hungry Cat",
  "text_content": "Me at 1am / The fridge",
  "language": "en",
  "source_url": "https://reddit.com/r/memes/...",
  "is_admin_curated": false,
  "ingested_at": "2025-06-06T06:00:00Z"
}]
```

---

### POST /functions/v1/increment-view

Increment view count for a meme.

**Request:**
```json
{ "meme_id": "550e8400-e29b-41d4-a716-446655440001" }
```

**Response 200:**
```json
{ "success": true, "new_count": 48321 }
```

---

## 4. Search APIs

---

### POST /functions/v1/search-memes

Advanced meme search with full-text and filters.

**Request:**
```json
{
  "query": "drake pointing",
  "filters": {
    "category_id": null,
    "year": null,
    "year_from": 2020,
    "year_to": 2024,
    "tags": ["drake", "comparison"],
    "is_trending": null
  },
  "sort": "relevance",
  "cursor": null,
  "limit": 20
}
```

**Response 200:**
```json
{
  "data": [
    {
      "id": "uuid",
      "title": "Drake Approves: Dark Mode",
      "thumbnail_url": "https://cdn.memeory.app/thumbnails/uuid.webp",
      "year": 2022,
      "view_count": 125000,
      "is_trending": false,
      "quality_score": 92,
      "category_slug": "humor",
      "relevance_score": 0.94
    }
  ],
  "pagination": {
    "has_more": true,
    "next_cursor": "uuid-last-item",
    "total_count": 847,
    "limit": 20
  },
  "query_time_ms": 145
}
```

---

### GET /functions/v1/search-suggestions?q={query}

Real-time search autocomplete suggestions.

**Request:**
```http
GET /functions/v1/search-suggestions?q=drak
```

**Response 200:**
```json
{
  "suggestions": [
    { "type": "query", "text": "drake pointing meme" },
    { "type": "query", "text": "drake disapproval" },
    { "type": "tag",   "text": "drake", "count": 342 },
    { "type": "template", "text": "Drake Pointing" }
  ]
}
```

---

### GET /rest/v1/meme_tags?order=usage_count.desc&limit=20

Get popular tags for search chips.

**Response 200:**
```json
[
  { "id": 1, "slug": "drake", "name": "drake", "usage_count": 342 },
  { "id": 2, "slug": "distracted-boyfriend", "name": "distracted-boyfriend", "usage_count": 289 }
]
```

---

## 5. Timeline APIs

---

### POST /functions/v1/get-timeline

Get memes for the "Years Ago Today" timeline.

**Request:**
```json
{
  "years": [1, 2, 3],
  "limit_per_year": 10
}
```

**Response 200:**
```json
{
  "data": {
    "1_year_ago": {
      "label_en": "Today, 1 Year Ago — June 6, 2024",
      "label_id": "Hari Ini, 1 Tahun Lalu — 6 Juni 2024",
      "date": "2024-06-06",
      "memes": [
        {
          "id": "uuid",
          "title": "...",
          "thumbnail_url": "...",
          "view_count": 98000,
          "quality_score": 89
        }
      ]
    },
    "2_years_ago": { "label_en": "...", "date": "2023-06-06", "memes": [] },
    "3_years_ago": { "label_en": "...", "date": "2022-06-06", "memes": [] }
  }
}
```

---

### GET /functions/v1/historical-timeline?start=2023-01-01&end=2023-12-31

Browse full historical meme timeline.

**Query Parameters:**

| Param | Type | Description |
|---|---|---|
| `start` | date | Start date (YYYY-MM-DD) |
| `end` | date | End date (YYYY-MM-DD) |
| `limit` | integer | Memes per period |
| `group_by` | string | `month` or `week` |

**Response 200:**
```json
{
  "data": [
    {
      "period": "2023-06",
      "label_en": "June 2023",
      "label_id": "Juni 2023",
      "memes": [{ "id": "uuid", "title": "...", "thumbnail_url": "..." }]
    }
  ]
}
```

---

## 6. Trending APIs

---

### GET /functions/v1/trending-memes

Get current trending memes.

**Query Parameters:**

| Param | Type | Default | Description |
|---|---|---|---|
| `platform` | string | `all` | `all\|reddit\|tiktok\|youtube\|admin` |
| `limit` | integer | 20 | Number of results |
| `category_id` | integer | null | Filter by category |

**Response 200:**
```json
{
  "data": [
    {
      "rank": 1,
      "rank_change": 2,
      "is_new": false,
      "meme": {
        "id": "uuid",
        "title": "When the AI writes better code than you",
        "thumbnail_url": "https://cdn.memeory.app/thumbnails/uuid.webp",
        "view_count": 285000,
        "source_platform": "reddit",
        "source_url": "https://reddit.com/r/ProgrammerHumor/...",
        "quality_score": 94,
        "emotion": "relatable"
      }
    }
  ],
  "last_updated": "2025-06-06T06:00:00Z",
  "next_update": "2025-06-06T12:00:00Z"
}
```

---

## 7. AI APIs

---

### POST /functions/v1/explain-meme

Generate or retrieve AI explanation for a meme.

**Auth:** Required  
**Rate Limit:** 50 requests/user/day

**Request:**
```json
{
  "meme_id": "550e8400-e29b-41d4-a716-446655440001",
  "language": "id",
  "force_refresh": false
}
```

**Response 200 (cached):**
```json
{
  "data": {
    "meme_id": "uuid",
    "from_cache": true,
    "generated_at": "2025-06-01T10:00:00Z",
    "language": "id",
    "explanation": {
      "meaning": "Meme ini menggunakan template Drake Pointing untuk menggambarkan preferensi seseorang antara dua pilihan...",
      "origin": "Template ini berasal dari video musik 'Hotline Bling' milik Drake yang dirilis pada tahun 2015...",
      "cultural_context": "Meme ini sangat populer di kalangan generasi milenial dan Gen Z karena menggambarkan dilema sehari-hari...",
      "popularity_reasons": "Formatnya yang sederhana dan fleksibel membuatnya mudah diadaptasi untuk berbagai situasi...",
      "related_events": null
    },
    "quality": {
      "thumbs_up": 234,
      "thumbs_down": 12
    }
  }
}
```

**Response 200 (newly generated):**
```json
{
  "data": {
    "meme_id": "uuid",
    "from_cache": false,
    "generated_at": "2025-06-06T10:00:00Z",
    "model_used": "llama3-70b-8192",
    "tokens_used": 847,
    "language": "id",
    "explanation": { "...": "..." }
  }
}
```

**Response 503 (AI unavailable):**
```json
{
  "data": null,
  "error": {
    "code": "AI_UNAVAILABLE",
    "message": "AI explanation service is temporarily unavailable. Please try again later.",
    "status": 503
  }
}
```

---

### POST /functions/v1/explanation-feedback

Submit quality feedback on an explanation.

**Auth:** Required

**Request:**
```json
{
  "meme_id": "uuid",
  "feedback": "thumbs_up"
}
```

**Response 200:**
```json
{ "success": true, "new_thumbs_up": 235, "new_thumbs_down": 12 }
```

---

### POST /functions/v1/similar-memes

Find similar memes using vector similarity.

**Request:**
```json
{
  "meme_id": "550e8400-e29b-41d4-a716-446655440001",
  "limit": 8,
  "threshold": 0.75
}
```

**Response 200:**
```json
{
  "data": [
    {
      "id": "uuid2",
      "title": "Drake meme but with cats",
      "thumbnail_url": "https://cdn.memeory.app/thumbnails/uuid2.webp",
      "similarity_score": 0.92,
      "year": 2023
    },
    {
      "id": "uuid3",
      "title": "Choosing between sleep and Netflix",
      "thumbnail_url": "https://cdn.memeory.app/thumbnails/uuid3.webp",
      "similarity_score": 0.87,
      "year": 2022
    }
  ],
  "source_meme_id": "550e8400-e29b-41d4-a716-446655440001",
  "computation_ms": 45
}
```

---

### GET /functions/v1/viral-prediction?meme_id={uuid}

Get viral prediction for a meme.

**Response 200:**
```json
{
  "data": {
    "meme_id": "uuid",
    "viral_score": 78,
    "prediction": "high",
    "confidence": 0.82,
    "reasoning_en": "This meme shows strong engagement velocity with 2,400% view growth in 24 hours. The relatable theme and universal format suggest strong sharing potential across demographics.",
    "reasoning_id": "Meme ini menunjukkan kecepatan engagement yang kuat dengan pertumbuhan tampilan 2.400% dalam 24 jam...",
    "signals": {
      "view_velocity": 2400,
      "bookmark_rate": 0.025,
      "cross_platform_presence": 3,
      "quality_score": 87,
      "days_since_posted": 1
    },
    "predicted_at": "2025-06-06T12:00:00Z",
    "valid_until": "2025-06-07T12:00:00Z"
  }
}
```

---

### GET /functions/v1/trend-report?date={YYYY-MM-DD}

Get daily trend report.

**Response 200:**
```json
{
  "data": {
    "report_date": "2025-06-06",
    "summary_en": "Today's meme landscape is dominated by tech and gaming content. AI-related memes are trending for the third consecutive day, with a notable surge in coding humor. The 'distracted boyfriend' template has seen a revival with modern tech contexts.",
    "summary_id": "Lanskap meme hari ini didominasi oleh konten teknologi dan gaming. Meme bertema AI trending untuk hari ketiga berturut-turut...",
    "top_memes": [
      { "id": "uuid1", "title": "When AI passes the Turing test", "rank": 1 },
      { "id": "uuid2", "title": "Monday vs Friday energy", "rank": 2 }
    ],
    "trending_categories": ["tech", "gaming", "humor"],
    "emerging_trends": ["AI coding memes", "WWDC reactions", "Minecraft memes"],
    "stats": {
      "total_memes_ingested": 156,
      "total_views": 48320,
      "new_trending_count": 8
    },
    "generated_at": "2025-06-06T00:30:00Z"
  }
}
```

---

## 8. Bookmark APIs

---

### GET /rest/v1/bookmarks?user_id=eq.{user_id}&order=created_at.desc

Get user's bookmarks.

**Auth:** Required (own bookmarks only)

**Response 200:**
```json
[
  {
    "id": "uuid",
    "user_id": "user-uuid",
    "meme_id": "meme-uuid",
    "created_at": "2025-06-05T14:30:00Z",
    "memes": {
      "id": "meme-uuid",
      "title": "...",
      "thumbnail_url": "...",
      "year": 2024
    }
  }
]
```

---

### POST /rest/v1/bookmarks

Add bookmark.

**Auth:** Required

**Request:**
```json
{
  "user_id": "user-uuid",
  "meme_id": "meme-uuid"
}
```

**Response 201:**
```json
{
  "id": "new-bookmark-uuid",
  "user_id": "user-uuid",
  "meme_id": "meme-uuid",
  "created_at": "2025-06-06T10:00:00Z"
}
```

**Response 409 (already bookmarked):**
```json
{
  "code": "23505",
  "message": "duplicate key value violates unique constraint"
}
```

---

### DELETE /rest/v1/bookmarks?user_id=eq.{user_id}&meme_id=eq.{meme_id}

Remove bookmark.

**Auth:** Required (own bookmarks only)

**Response 204:** No content

---

### GET /functions/v1/check-bookmark?meme_id={uuid}

Check if current user has bookmarked a meme.

**Auth:** Required

**Response 200:**
```json
{ "is_bookmarked": true, "bookmark_id": "uuid" }
```

---

## 9. Categories & Tags APIs

---

### GET /rest/v1/meme_categories?is_active=eq.true&order=sort_order.asc

Get all active categories.

**Response 200:**
```json
[
  { "id": 1, "slug": "humor", "name_en": "Humor", "name_id": "Humor", "icon": "😂", "color_hex": "#F59E0B" },
  { "id": 2, "slug": "gaming", "name_en": "Gaming", "name_id": "Gaming", "icon": "🎮", "color_hex": "#8B5CF6" }
]
```

---

### GET /rest/v1/meme_tags?order=usage_count.desc&limit=50

Get popular tags.

---

## 10. Admin APIs (Protected)

These endpoints require `role = 'admin'` in the user's profile.

---

### POST /functions/v1/admin/ingest-meme

Manually ingest a meme (admin only).

**Request:**
```json
{
  "title": "New meme title",
  "thumbnail_url": "https://...",
  "media_url": "https://...",
  "media_type": "image",
  "original_date": "2025-06-06",
  "category_id": 1,
  "tags": ["new", "trending"],
  "source_platform": "admin",
  "is_admin_curated": true
}
```

---

### POST /functions/v1/admin/run-agent

Manually trigger an AI agent (admin only).

**Request:**
```json
{
  "agent_id": "agent-001",
  "input": { "sources": ["reddit"], "limit_per_source": 10 }
}
```

**Response 200:**
```json
{
  "run_id": "uuid",
  "agent_id": "agent-001",
  "status": "running",
  "started_at": "2025-06-06T10:00:00Z"
}
```

---

## Rate Limiting

All endpoints enforce rate limiting via Supabase:

| Endpoint Group | Authenticated | Unauthenticated |
|---|---|---|
| General APIs | 100 req/min | 30 req/min |
| Search | 30 req/min | 10 req/min |
| AI Explanations | 10 req/min | N/A (auth required) |
| Bookmarks | 60 req/min | N/A |

Rate limit headers returned on every response:
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 87
X-RateLimit-Reset: 1717668060
```
