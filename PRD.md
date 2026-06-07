# PRD.md — Product Requirements Document

> **Product:** Memeory  
> **Tagline:** Relive the Internet's Funniest Memories  
> **Version:** 1.0.0  
> **Status:** Active Development  
> **Author:** Product Team  
> **Last Updated:** 2025

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Problem Statement](#2-problem-statement)
3. [Goals & Success Metrics](#3-goals--success-metrics)
4. [Target Users](#4-target-users)
5. [User Personas](#5-user-personas)
6. [User Stories](#6-user-stories)
7. [Feature Requirements](#7-feature-requirements)
8. [Non-Functional Requirements](#8-non-functional-requirements)
9. [Design Requirements](#9-design-requirements)
10. [Technical Constraints](#10-technical-constraints)
11. [Out of Scope (v1)](#11-out-of-scope-v1)
12. [Dependencies & Risks](#12-dependencies--risks)
13. [Launch Criteria](#13-launch-criteria)

---

## 1. Executive Summary

Memeory is a cross-platform meme discovery and nostalgia application that allows users to explore, understand, and compare memes across time. By combining a curated meme archive with AI-powered explanations and viral trend analysis, Memeory creates a unique experience at the intersection of internet culture, nostalgia, and AI.

**Primary Value Proposition:**  
"See what was funny exactly 1, 2, or 3 years ago today — and understand why."

**Platform:** Flutter (Web, Android, iOS)  
**Backend:** Supabase + Groq API  
**Initial Market:** Indonesia → Global

---

## 2. Problem Statement

### The Problem

Internet users love memes, but the ephemeral nature of online culture means that most memes are forgotten within days or weeks. There is currently no centralized, curated, AI-enhanced platform that:

1. **Preserves** meme history in a searchable archive
2. **Contextualizes** memes for users who missed the original cultural moment
3. **Connects** past memes to current trends
4. **Predicts** which memes will go viral next

### Evidence

- Over 55% of internet users share memes at least once a week (Statista, 2024)
- "What does this meme mean?" is searched millions of times per month on Google
- No existing app provides a time-based meme nostalgia experience
- Indonesian internet users are among the highest meme consumers in Southeast Asia
- Gen Z and Millennials (18–35) represent the core meme audience and actively seek nostalgic internet content

### Pain Points

| Pain Point | Current Solution | Gap |
|---|---|---|
| "I don't understand this meme" | Google search | Fragmented, unreliable, no structure |
| "What was trending last year?" | Reddit archives | Requires domain knowledge, hard to navigate |
| "Find memes similar to this" | No good solution | Does not exist at scale |
| "Is this meme going to go viral?" | Gut feel | No data-backed prediction tool |
| "I want to feel nostalgic about old memes" | Random Reddit browsing | Unstructured, no time-based experience |

---

## 3. Goals & Success Metrics

### Business Goals

| Goal | Metric | Target (6 months) |
|---|---|---|
| User Acquisition | Registered users | 50,000 |
| Engagement | DAU/MAU ratio | ≥ 25% |
| Retention | 7-day retention | ≥ 40% |
| Content | Indexed memes | 100,000+ |
| Monetization readiness | Premium feature usage | 15% of users |

### Product Goals

| Goal | Metric | Target |
|---|---|---|
| Performance | App load time (P95) | < 2 seconds |
| AI Quality | Explanation satisfaction rate | ≥ 80% thumbs up |
| Search Quality | Search result relevance | ≥ 75% click-through |
| Availability | Uptime | 99.5% |
| Localization | EN + ID coverage | 100% of strings |

### Key Performance Indicators (KPIs)

- **Activation Rate:** % of users who search a meme within first session
- **Feature Adoption:** % of users who use AI explanation at least once
- **Timeline Engagement:** % of users who open Meme Timeline feature
- **Session Length:** Average session duration > 4 minutes
- **Viral Coefficient:** K-factor for organic sharing

---

## 4. Target Users

### Primary Market: Indonesia (Phase 1)

- Age: 16–35
- Platform: Mobile-first (Android 70%, iOS 20%, Web 10%)
- Language: Indonesian (Bahasa Indonesia) + English
- Behavior: High social media consumption, meme culture deeply embedded
- Channels: WhatsApp, Instagram, TikTok, Twitter/X

### Secondary Market: Global English-speaking (Phase 2)

- Age: 18–34
- Platform: Web + Mobile balanced
- Language: English
- Behavior: Reddit, Twitter, Discord users

---

## 5. User Personas

### Persona 1 — "Reza, The Nostalgic Scroller" (Primary)

- **Age:** 22, University student in Surabaya
- **Devices:** Android phone, occasional laptop
- **Behavior:** Scrolls memes daily, shares in WhatsApp groups, loves throwback content
- **Goal:** Relive funny moments from the internet's past, understand memes his friends share
- **Frustration:** Doesn't understand "boomer" or older memes; wants context
- **Motivation:** Social currency, humor, nostalgia

### Persona 2 — "Sinta, The Trend Tracker" (Primary)

- **Age:** 26, Content creator in Jakarta
- **Devices:** iPhone + MacBook
- **Behavior:** Tracks trends professionally, creates meme-adjacent content
- **Goal:** Stay ahead of meme trends, identify viral potential early
- **Frustration:** Scattered sources, no single trend dashboard
- **Motivation:** Professional relevance, content creation efficiency

### Persona 3 — "Budi, The Curious Explorer" (Secondary)

- **Age:** 34, Marketing professional
- **Devices:** Web browser primarily
- **Behavior:** Uses memes in presentations and campaigns, needs context for each meme
- **Goal:** Understand meme origins for professional use cases
- **Frustration:** Unreliable explanations, no authoritative source
- **Motivation:** Professional credibility, understanding pop culture

---

## 6. User Stories

### Authentication

| ID | As a... | I want to... | So that... | Priority |
|---|---|---|---|---|
| US-001 | New user | Sign up with Google | I can register quickly without a password | P0 |
| US-002 | New user | Sign up with email/password | I can create an account without Google | P0 |
| US-003 | Returning user | Log in with my credentials | I can access my saved bookmarks and preferences | P0 |
| US-004 | Logged-in user | Log out securely | My account is protected | P1 |
| US-005 | User | Change my language preference | The app displays in my preferred language | P1 |

### Meme Discovery & Search

| ID | As a... | I want to... | So that... | Priority |
|---|---|---|---|---|
| US-010 | User | Search memes by keyword | I can find specific memes quickly | P0 |
| US-011 | User | Filter search by year | I can find memes from a specific time period | P0 |
| US-012 | User | Filter search by category | I can browse memes within a topic I like | P1 |
| US-013 | User | Filter search by tags | I can find closely related memes | P1 |
| US-014 | User | See search suggestions as I type | I can find content faster | P2 |
| US-015 | User | Browse trending searches | I can discover what others are looking for | P2 |

### Meme Timeline

| ID | As a... | I want to... | So that... | Priority |
|---|---|---|---|---|
| US-020 | User | See what memes were trending 1 year ago today | I can feel nostalgic | P0 |
| US-021 | User | See what memes were trending 2–3 years ago | I can explore deeper history | P0 |
| US-022 | User | Browse a historical meme timeline | I can see the evolution of meme culture | P1 |
| US-023 | User | Share a meme from the past | I can share nostalgia with friends | P1 |

### Trending Memes

| ID | As a... | I want to... | So that... | Priority |
|---|---|---|---|---|
| US-030 | User | See currently trending memes | I can stay up to date with meme culture | P0 |
| US-031 | User | Know the source of a trending meme | I can verify and explore further | P1 |
| US-032 | User | Filter trending by platform (Reddit, TikTok, etc.) | I can see platform-specific trends | P2 |

### AI Features

| ID | As a... | I want to... | So that... | Priority |
|---|---|---|---|---|
| US-040 | User | Get an AI explanation of any meme | I can understand memes I don't recognize | P0 |
| US-041 | User | Read the explanation in Bahasa Indonesia | I can understand in my native language | P0 |
| US-042 | User | Find similar memes | I can explore related content | P1 |
| US-043 | User | See a daily AI trend summary | I can catch up quickly | P1 |
| US-044 | User | Check if a meme might go viral | I can make informed sharing decisions | P2 |

### Bookmarks & Personal

| ID | As a... | I want to... | So that... | Priority |
|---|---|---|---|---|
| US-050 | Logged-in user | Bookmark a meme | I can save it for later | P1 |
| US-051 | Logged-in user | View all my bookmarked memes | I can access my personal collection | P1 |
| US-052 | Logged-in user | Remove a bookmark | I can manage my collection | P1 |

---

## 7. Feature Requirements

### F-01: Meme Search

**Description:** Full-text and faceted search across the meme database.

**Functional Requirements:**
- FR-01.1: Search by title (partial match supported)
- FR-01.2: Filter by year (single year or range)
- FR-01.3: Filter by category (dropdown multi-select)
- FR-01.4: Filter by tags (chip-based multi-select)
- FR-01.5: Filter by trending status (boolean toggle)
- FR-01.6: Pagination (cursor-based, 20 items per page)
- FR-01.7: Search results sorted by relevance (default), newest, most viewed
- FR-01.8: Search response time < 500ms (P95)

**Acceptance Criteria:**
- Searching "Drake" returns all memes tagged with Drake meme template
- Year filter "2022" returns only memes with `year = 2022`
- Empty results state shown with helpful suggestion
- Search query is preserved when navigating back

---

### F-02: Meme Timeline

**Description:** Time-based browsing experience showing memes from exactly 1, 2, and 3 years ago.

**Functional Requirements:**
- FR-02.1: Display top 10 memes from exactly 1 year ago today
- FR-02.2: Display top 10 memes from exactly 2 years ago today
- FR-02.3: Display top 10 memes from exactly 3 years ago today
- FR-02.4: Full chronological timeline mode (browse by month/year)
- FR-02.5: Swipeable card UI for timeline browsing
- FR-02.6: Timeline refreshes daily at midnight local time

**Acceptance Criteria:**
- On June 6, 2025, "1 year ago" shows memes from June 5–7, 2024 (±1 day window)
- Each timeline card shows: thumbnail, title, view count, source
- Timeline section header shows "Today, 1 Year Ago — June 6, 2024"

---

### F-03: Trending Memes

**Description:** Real-time and near-real-time trending meme feed updated every 6 hours.

**Functional Requirements:**
- FR-03.1: Display top 20 trending memes updated every 6 hours
- FR-03.2: Show source badge (Reddit, TikTok, YouTube, Admin)
- FR-03.3: Show trending rank and rank change (↑↓)
- FR-03.4: Show engagement signals (view count, shares)
- FR-03.5: Filter by source platform

**Acceptance Criteria:**
- Trending list updates within 6 hours of major trend changes
- Source badge renders correct platform logo
- New entries in trending list are highlighted with "NEW" badge

---

### F-04: AI Meme Explanation

**Description:** On-demand AI-powered explanation of any meme in the database.

**Functional Requirements:**
- FR-04.1: Trigger explanation from meme detail page
- FR-04.2: Show loading state with skeleton UI (max 5 seconds)
- FR-04.3: Display: Meaning, Origin, Cultural Context, Popularity Reasons
- FR-04.4: Language toggle: English / Indonesian
- FR-04.5: User feedback: thumbs up / thumbs down on explanation quality
- FR-04.6: Cache explanation (30 days) to avoid redundant API calls

**Acceptance Criteria:**
- Explanation generated within 5 seconds for 95% of requests
- Cached explanations load instantly (< 100ms)
- Language toggle switches content without page reload
- Feedback recorded in database for quality monitoring

---

### F-05: Similar Meme Search

**Description:** AI-powered vector similarity search to find related memes.

**Functional Requirements:**
- FR-05.1: Show up to 8 similar memes on meme detail page
- FR-05.2: Similarity based on: template, tags, category, text content
- FR-05.3: Each similar meme shows: thumbnail, title, similarity badge
- FR-05.4: Similarity search result cached for 24 hours

**Acceptance Criteria:**
- Similar memes are genuinely related (not random)
- Results load within 1 second (using pre-computed vectors)
- At least 4 results shown when sufficient similar memes exist

---

### F-06: Meme Trend Summary

**Description:** Daily AI-generated report summarizing the day's meme trends.

**Functional Requirements:**
- FR-06.1: Generate daily report at 00:00 UTC
- FR-06.2: Report includes: top memes, top categories, emerging trends
- FR-06.3: Natural language summary (EN + ID)
- FR-06.4: Accessible from home screen as "Today's Trend Report"
- FR-06.5: Archive of past reports (last 30 days)

---

### F-07: Viral Prediction

**Description:** AI prediction of a meme's viral potential.

**Functional Requirements:**
- FR-07.1: Display viral score (0–100) with visual gauge
- FR-07.2: Show prediction category: Low / Medium / High / Very High
- FR-07.3: Show 2–3 sentence reasoning
- FR-07.4: Prediction available on meme detail page
- FR-07.5: Predictions updated daily or when engagement changes significantly

---

### F-08: Authentication

**Description:** User authentication via Supabase Auth.

**Functional Requirements:**
- FR-08.1: Google OAuth 2.0 sign-in
- FR-08.2: Email + password registration and login
- FR-08.3: Email verification for new email accounts
- FR-08.4: Password reset via email
- FR-08.5: Persistent session with secure token refresh
- FR-08.6: Profile creation on first login (username, avatar)

---

### F-09: Bookmarks

**Description:** Save and manage favorite memes.

**Functional Requirements:**
- FR-09.1: Bookmark icon on every meme card
- FR-09.2: Bookmarks persisted to database (available across devices)
- FR-09.3: Dedicated Bookmarks screen in profile section
- FR-09.4: Remove bookmark with swipe-to-delete or button
- FR-09.5: Bookmark count visible on profile

---

## 8. Non-Functional Requirements

### Performance

| Requirement | Target |
|---|---|
| App cold start (mobile) | < 3 seconds |
| Screen navigation (warm) | < 200ms |
| API response time (P50) | < 300ms |
| API response time (P95) | < 1000ms |
| AI explanation generation | < 5 seconds |
| Search results | < 500ms |
| Image loading (progressive) | < 1 second |

### Scalability

- Architecture must support 100,000 concurrent users
- Database designed for 10M+ meme records
- CDN-backed image delivery (Supabase Storage + CDN)
- Stateless API layer (horizontal scaling ready)

### Security

- All API calls use HTTPS/TLS 1.3
- JWT tokens with 1-hour expiry, 7-day refresh
- Supabase RLS (Row Level Security) on all user data tables
- Input sanitization on all search and form inputs
- Rate limiting: 100 req/min per user, 1000 req/min per IP
- GROQ API key never exposed to client

### Reliability

- 99.5% uptime SLA
- Graceful degradation when AI services are unavailable
- Offline cache for last-viewed memes (mobile)
- Error boundaries on all major UI components

### Accessibility

- WCAG 2.1 AA compliance
- Screen reader support (semantics labels in Flutter)
- Minimum touch target size: 44×44 pt
- Sufficient color contrast (minimum 4.5:1)

---

## 9. Design Requirements

### Visual Design

- **Style:** Minimalist, modern, colorful
- **Color Palette:**
  - Primary accent: Electric Purple `#7C3AED`
  - Secondary accent: Vivid Pink `#EC4899`
  - Tertiary accent: Cyan `#06B6D4`
  - Background (dark): `#0F0F0F`
  - Background (light): `#FAFAFA`
  - Surface (dark): `#1A1A1A`
  - Surface (light): `#FFFFFF`
  - Text primary (dark): `#F5F5F5`
  - Text primary (light): `#111111`
  - Gray scale: `#6B7280`, `#9CA3AF`, `#D1D5DB`

### Theme

- **Dark Mode:** Default (primary experience)
- **Light Mode:** Fully supported, user-selectable
- **System theme:** Follow device setting by default

### Typography

- Headlines: `Poppins` (Bold, SemiBold)
- Body: `Inter` (Regular, Medium)
- Monospace/code: `JetBrains Mono`
- Minimum body font size: 14sp
- Line height: 1.5× for body text

### Animation

- Page transitions: Fade + slide (200ms, ease-in-out)
- Loading skeletons: Shimmer effect
- Meme cards: Spring animation on tap
- Scroll: Smooth momentum scroll
- Viral score gauge: Animated fill on load

### Responsive Breakpoints

| Breakpoint | Width | Layout |
|---|---|---|
| Mobile S | < 360px | Single column, compact |
| Mobile M | 360–480px | Single column, standard |
| Tablet | 481–1024px | Two-column grid |
| Desktop | > 1024px | Three-column grid, sidebar |

---

## 10. Technical Constraints

- **Flutter SDK:** Minimum 3.22.x (stable channel)
- **Dart SDK:** Minimum 3.4.x
- **Min Android SDK:** API 24 (Android 7.0)
- **Min iOS Version:** iOS 14.0
- **Supabase:** Free tier must be viable for MVP; designed for Pro tier at scale
- **Groq API:** Rate limit 14,400 requests/day (free tier) — cache aggressively
- **Image Storage:** Supabase Storage with 50GB free tier; CDN required for production
- **No native platform channels** unless unavoidable (prefer Flutter-only solutions)

---

## 11. Out of Scope (v1)

The following features are explicitly deferred to future versions:

| Feature | Target Version | Notes |
|---|---|---|
| Meme Battle (voting) | v2 | Requires community features |
| Community Uploads | v2 | Moderation pipeline needed |
| Meme Museum (collections) | v2 | Curation effort required |
| AI Meme Generator | v3 | Requires image generation model |
| Meme Analytics Dashboard | v2 | Creator-facing feature |
| Creator Profiles | v2 | Identity/verification system |
| Push Notifications | v1.1 | Post-MVP |
| Social Graph / Following | v2 | Community phase |
| Comments / Reactions | v2 | Community phase |

---

## 12. Dependencies & Risks

### External Dependencies

| Dependency | Risk Level | Mitigation |
|---|---|---|
| Groq API availability | Medium | Fallback to cached explanations |
| Reddit API (trending) | High | Rate limits; scraper fallback |
| TikTok data access | High | No official API; use aggregator |
| YouTube Data API v3 | Low | Well-documented, stable |
| Supabase uptime | Low | 99.9% SLA on Pro tier |

### Technical Risks

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| Groq API rate limits hit | Medium | High | Aggressive caching, batch processing |
| Meme copyright claims | Medium | High | DMCA process, admin moderation |
| Content moderation gaps | Medium | High | Agent 006 + human review queue |
| Flutter web performance | Low | Medium | Code splitting, lazy loading |
| Database scaling at 10M+ records | Low | High | Proper indexing, partitioning strategy |

---

## 13. Launch Criteria

### MVP Launch Checklist

- [ ] Authentication (Google + Email) working on all platforms
- [ ] Meme search with at least 3 filter types functional
- [ ] Meme Timeline showing 1, 2, 3 years ago
- [ ] Trending memes feed updated every 6 hours
- [ ] AI Explanation working for all memes
- [ ] Dark mode and light mode fully styled
- [ ] Indonesian and English localization complete
- [ ] App loads in < 3 seconds on mid-range Android
- [ ] All RLS policies enabled and tested
- [ ] No P0 or P1 bugs open
- [ ] 1,000+ memes indexed before launch
- [ ] Privacy Policy and Terms of Service published
- [ ] App Store and Play Store listings ready
- [ ] Crash reporting (Sentry/Firebase Crashlytics) configured

### Definition of Done (Per Feature)

- Unit tests written and passing (≥ 70% coverage)
- Integration tests written for critical paths
- QA sign-off on all acceptance criteria
- UI reviewed in both dark and light mode
- EN + ID strings verified by native speaker
- Performance benchmark met
- Accessibility check passed
