# TASKS.md — Development Task Breakdown

> **Project:** Memeory  
> **Version:** 1.0.0  
> **Methodology:** Agile (2-week sprints)  
> **Estimated Total Duration:** 18 weeks (9 phases)

---

## Legend

| Symbol | Meaning |
|---|---|
| 🔴 P0 | Critical — blocks release |
| 🟠 P1 | High — core feature |
| 🟡 P2 | Medium — enhances experience |
| 🟢 P3 | Low — nice to have |
| `BE` | Backend (Supabase / Edge Functions) |
| `FE` | Frontend (Flutter) |
| `AI` | AI / Groq API |
| `OPS` | DevOps / Infrastructure |
| `QA` | Quality Assurance |

---

## Phase 1: Project Setup (Week 1–2)

**Goal:** Establish development environment, tooling, CI/CD, and project skeleton.

**Implementation Status (2026-06-06):**

| ID | Status | Notes |
|---|---|---|
| T-001 | Blocked | GitHub repository and branch protection require GitHub account/repository access. Current folder is not a git repository. |
| T-002 | Partial | Flutter app source and web scaffolding created manually. `flutter create` could not run because Flutter is not installed/on PATH. Android/iOS platform folders must be generated once Flutter is available. |
| T-003 | Completed | Added strict `analysis_options.yaml`. |
| T-004 | Completed | Added `pubspec.yaml` with Phase 1 dependencies, adapted to Riverpod per current requirement. |
| T-005 | Not started | IDE settings can be added after preferred editor/project workspace is confirmed. |
| T-006 | Completed | Added `.env.example`; local placeholder `.env` exists and is gitignored. |
| T-007 | Completed | Added `flutter_dotenv` bootstrap with guarded Supabase initialization. |
| T-008 | Completed | Added `Makefile` for common Flutter and Supabase commands. |
| T-010 | Completed | Added GitHub Actions CI for dependency install, l10n generation, analyze, test, and web build. |
| T-011 | Blocked | Fastlane Android deployment requires Android signing and Play Store credentials. |
| T-012 | Blocked | Fastlane iOS deployment requires Apple developer credentials and macOS runner setup. |
| T-013 | Blocked | Firebase App Distribution requires Firebase project credentials. |
| T-014 | Partial | Sentry Flutter dependency/config hook added; real DSN/project setup remains external. |
| T-015 | Partial | CI runs tests; external reporting service not configured. |
| T-020 | Blocked | Supabase production/staging projects require Supabase account access. |
| T-021 | Blocked | Supabase CLI is not installed/on PATH in this environment. |
| T-022 | Completed | Added Supabase migrations directory and initial migrations. |
| T-023 | Completed | Added storage bucket migration for `meme-thumbnails`, `meme-media`, and `avatars`. |
| T-024 | Completed | Added Edge Functions folder, shared utilities, and health function. |
| T-025 | Not started | Realtime configuration depends on schema tables from later phases. |
| T-026 | Completed | Added pgvector/vector extension migration. |
| T-030 | Completed | Added feature-first Clean Architecture folders adapted for Riverpod. |
| T-031 | Completed | Replaced BLoC/get_it/injectable setup with Riverpod provider architecture per current requirement. |
| T-032 | Completed | Added `go_router` route definitions for initial app shell. |
| T-033 | Completed | Added dark/light `AppTheme`, color tokens, spacing, radius, and typography. |
| T-034 | Completed | Added Flutter localization setup with EN and ID ARB files. |
| T-035 | Completed | Added guarded Supabase `ApiClient` wrapper/provider. |
| T-036 | Completed | Replaced HydratedBloc with Riverpod + SharedPreferences persisted theme/language preferences. |

### 1.1 Repository & Tooling Setup

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-001 | Create GitHub repository with branch protection rules (main, develop, feature/*) | OPS | 🔴 P0 | 1h | DevOps |
| T-002 | Initialize Flutter project with `flutter create memeory --platforms=web,android,ios` | FE | 🔴 P0 | 30m | Flutter |
| T-003 | Configure `analysis_options.yaml` with strict linting rules (flutter_lints + custom) | FE | 🔴 P0 | 1h | Flutter |
| T-004 | Set up `pubspec.yaml` with all initial dependencies (see dependency list below) | FE | 🔴 P0 | 2h | Flutter |
| T-005 | Configure VS Code / Android Studio workspace settings and recommended extensions | OPS | 🟡 P2 | 1h | DevOps |
| T-006 | Create `.env.example` and document all environment variables | OPS | 🔴 P0 | 1h | DevOps |
| T-007 | Set up `flutter_dotenv` for environment variable management | FE | 🔴 P0 | 1h | Flutter |
| T-008 | Configure Makefile with common commands (build, test, lint, deploy) | OPS | 🟠 P1 | 2h | DevOps |

### 1.2 CI/CD Pipeline

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-010 | Set up GitHub Actions workflow for: lint, test, build (Android + iOS + Web) | OPS | 🔴 P0 | 4h | DevOps |
| T-011 | Configure Fastlane for Android build and Play Store deployment | OPS | 🟠 P1 | 4h | DevOps |
| T-012 | Configure Fastlane for iOS build and App Store deployment | OPS | 🟠 P1 | 4h | DevOps |
| T-013 | Set up Firebase App Distribution for internal testing builds | OPS | 🟠 P1 | 2h | DevOps |
| T-014 | Configure Sentry SDK for crash reporting (Flutter + backend) | OPS | 🟠 P1 | 2h | DevOps |
| T-015 | Set up automated test reporting in GitHub Actions | OPS | 🟡 P2 | 2h | DevOps |

### 1.3 Supabase Project Setup

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-020 | Create Supabase project (production + staging environments) | BE | 🔴 P0 | 1h | Backend |
| T-021 | Install Supabase CLI and configure local development | BE | 🔴 P0 | 1h | Backend |
| T-022 | Initialize Supabase migrations directory structure | BE | 🔴 P0 | 1h | Backend |
| T-023 | Configure Supabase Storage buckets: `meme-thumbnails`, `meme-media`, `avatars` | BE | 🔴 P0 | 1h | Backend |
| T-024 | Set up Supabase Edge Functions runtime (Deno) | BE | 🔴 P0 | 1h | Backend |
| T-025 | Configure Supabase Realtime for live trending updates | BE | 🟠 P1 | 2h | Backend |
| T-026 | Enable pgvector extension in Supabase for similarity search | BE | 🔴 P0 | 30m | Backend |

### 1.4 Flutter Architecture Setup

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-030 | Set up folder structure per FOLDER_STRUCTURE.md | FE | 🔴 P0 | 2h | Flutter |
| T-031 | Implement Riverpod provider architecture and dependency wiring | FE | 🔴 P0 | 4h | Flutter |
| T-032 | Configure `go_router` with all route definitions and deep linking | FE | 🔴 P0 | 3h | Flutter |
| T-033 | Create `AppTheme` class with dark + light themes, color system, typography | FE | 🔴 P0 | 4h | Flutter |
| T-034 | Implement localization setup (flutter_localizations + arb files for EN + ID) | FE | 🔴 P0 | 3h | Flutter |
| T-035 | Create base `ApiClient` wrapper around Supabase client | FE | 🔴 P0 | 2h | Flutter |
| T-036 | Set up Riverpod + local persistence for theme and language preference | FE | 🟠 P1 | 2h | Flutter |

**Initial Dependencies (pubspec.yaml):**
```yaml
dependencies:
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5
  go_router: ^14.0.0
  supabase_flutter: ^2.5.0
  flutter_dotenv: ^5.1.0
  cached_network_image: ^3.3.1
  shimmer: ^3.0.0
  flutter_localizations: sdk: flutter
  intl: ^0.19.0
  freezed_annotation: ^2.4.1
  json_annotation: ^4.9.0
  dartz: ^0.10.1
  shared_preferences: ^2.2.3
  path_provider: ^2.1.3
  google_sign_in: ^6.2.1
  fl_chart: ^0.68.0
  lottie: ^3.1.2
  flutter_animate: ^4.5.0
  share_plus: ^9.0.0
  url_launcher: ^6.3.0

dev_dependencies:
  build_runner: ^2.4.11
  freezed: ^2.5.2
  json_serializable: ^6.8.0
  riverpod_generator: ^2.4.0
  riverpod_lint: ^2.3.10
  custom_lint: ^0.6.4
  flutter_lints: ^4.0.0
  mocktail: ^1.0.4
```

---

## Phase 2: Authentication (Week 2–3)

**Goal:** Complete user authentication flow with Supabase Auth.

### 2.1 Backend Auth Setup

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-040 | Configure Supabase Auth with Google OAuth provider | BE | 🔴 P0 | 2h | Backend |
| T-041 | Set up email/password auth with email confirmation | BE | 🔴 P0 | 1h | Backend |
| T-042 | Create `profiles` table migration with trigger on `auth.users` insert | BE | 🔴 P0 | 2h | Backend |
| T-043 | Write RLS policies for `profiles` table (users can only read/update own profile) | BE | 🔴 P0 | 1h | Backend |
| T-044 | Create `handle_new_user()` PostgreSQL function + trigger | BE | 🔴 P0 | 1h | Backend |
| T-045 | Configure JWT expiry settings (access: 1h, refresh: 7d) | BE | 🟠 P1 | 30m | Backend |

### 2.2 Flutter Auth Implementation

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-050 | Create `AuthRepository` with Supabase Auth methods | FE | 🔴 P0 | 3h | Flutter |
| T-051 | Implement `AuthBloc` with states: Initial, Loading, Authenticated, Unauthenticated, Error | FE | 🔴 P0 | 3h | Flutter |
| T-052 | Build `SplashScreen` with auth state check and redirect logic | FE | 🔴 P0 | 2h | Flutter |
| T-053 | Build `LoginScreen` with Google Sign-In button and email/password form | FE | 🔴 P0 | 4h | Flutter |
| T-054 | Build `RegisterScreen` with email/password/username form and validation | FE | 🔴 P0 | 3h | Flutter |
| T-055 | Build `ForgotPasswordScreen` with email input and reset flow | FE | 🟠 P1 | 2h | Flutter |
| T-056 | Implement deep link handler for email verification and password reset | FE | 🟠 P1 | 2h | Flutter |
| T-057 | Build `ProfileSetupScreen` for first-time login (avatar + username) | FE | 🟠 P1 | 3h | Flutter |
| T-058 | Implement session persistence and automatic token refresh | FE | 🔴 P0 | 2h | Flutter |
| T-059 | Add form validation with error messages in EN + ID | FE | 🔴 P0 | 2h | Flutter |

### 2.3 Auth QA

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-060 | Unit tests for AuthBloc (all state transitions) | QA | 🔴 P0 | 3h | QA |
| T-061 | Integration tests for full Google Sign-In flow | QA | 🟠 P1 | 2h | QA |
| T-062 | Test RLS policies prevent cross-user data access | QA | 🔴 P0 | 1h | QA |

---

## Phase 3: Database & Core Models (Week 3–4)

**Goal:** Create all database tables, migrations, indexes, and RLS policies.

### 3.1 Database Migrations

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-070 | Create migration: `meme_categories` table + seed data | BE | 🔴 P0 | 1h | Backend |
| T-071 | Create migration: `memes` table with all columns + indexes | BE | 🔴 P0 | 2h | Backend |
| T-072 | Create migration: `meme_tags` and `meme_tag_relations` tables | BE | 🔴 P0 | 1h | Backend |
| T-073 | Create migration: `meme_sources` table | BE | 🔴 P0 | 1h | Backend |
| T-074 | Create migration: `meme_views` table (optimized for write-heavy load) | BE | 🔴 P0 | 1h | Backend |
| T-075 | Create migration: `bookmarks` table + RLS | BE | 🔴 P0 | 1h | Backend |
| T-076 | Create migration: `ai_explanations` table | BE | 🔴 P0 | 1h | Backend |
| T-077 | Create migration: `trend_reports` table | BE | 🟠 P1 | 1h | Backend |
| T-078 | Create migration: `viral_predictions` table | BE | 🟠 P1 | 1h | Backend |
| T-079 | Create migration: `agent_logs` table | BE | 🟠 P1 | 1h | Backend |
| T-080 | Add pgvector `embedding` column to `memes` table | BE | 🔴 P0 | 30m | Backend |
| T-081 | Create all database indexes (full-text search, date, category, tags) | BE | 🔴 P0 | 2h | Backend |
| T-082 | Write and apply all RLS policies for all tables | BE | 🔴 P0 | 3h | Backend |
| T-083 | Create seed data script: 500 sample memes across all categories/years | BE | 🟠 P1 | 4h | Backend |

### 3.2 Flutter Data Layer

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-090 | Generate Dart model classes with freezed for all entities | FE | 🔴 P0 | 4h | Flutter |
| T-091 | Implement `MemeRepository` with Supabase queries | FE | 🔴 P0 | 4h | Flutter |
| T-092 | Implement `BookmarkRepository` | FE | 🔴 P0 | 2h | Flutter |
| T-093 | Implement `CategoryRepository` | FE | 🟠 P1 | 1h | Flutter |
| T-094 | Implement local caching strategy with `hydrated_bloc` | FE | 🟠 P1 | 3h | Flutter |
| T-095 | Create pagination helper (cursor-based) | FE | 🔴 P0 | 2h | Flutter |

---

## Phase 4: Search Feature (Week 4–5)

**Goal:** Complete meme search with filters, pagination, and result display.

### 4.1 Backend Search

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-100 | Create Supabase full-text search function for memes | BE | 🔴 P0 | 3h | Backend |
| T-101 | Create stored procedure: `search_memes(query, filters, cursor, limit)` | BE | 🔴 P0 | 3h | Backend |
| T-102 | Add GIN index on `memes.search_vector` (tsvector) | BE | 🔴 P0 | 1h | Backend |
| T-103 | Create `get_trending_searches()` function (last 24h query analytics) | BE | 🟡 P2 | 2h | Backend |
| T-104 | Create search analytics table `search_queries` to log search terms | BE | 🟡 P2 | 1h | Backend |

### 4.2 Flutter Search Implementation

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-110 | Create `SearchBloc` with states: idle, loading, loaded, error, empty | FE | 🔴 P0 | 3h | Flutter |
| T-111 | Build `SearchScreen` with search bar, filter chips, results grid | FE | 🔴 P0 | 5h | Flutter |
| T-112 | Implement debounced search (300ms) with real-time suggestions | FE | 🟠 P1 | 2h | Flutter |
| T-113 | Build `FilterBottomSheet` with: year range, category, tags, sort order | FE | 🟠 P1 | 4h | Flutter |
| T-114 | Implement infinite scroll with cursor-based pagination | FE | 🔴 P0 | 3h | Flutter |
| T-115 | Build `MemeCard` component (reusable across all screens) | FE | 🔴 P0 | 4h | Flutter |
| T-116 | Build `EmptySearchState` widget with suggestions | FE | 🟠 P1 | 1h | Flutter |
| T-117 | Build `MemeDetailScreen` (full meme view, metadata, actions) | FE | 🔴 P0 | 5h | Flutter |
| T-118 | Implement meme view tracking (increment view count on detail open) | FE | 🟠 P1 | 1h | Flutter |
| T-119 | Add share functionality (share meme URL + image) | FE | 🟡 P2 | 2h | Flutter |

---

## Phase 5: Meme Timeline (Week 5–6)

**Goal:** Build the nostalgia timeline feature.

### 5.1 Backend Timeline

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-130 | Create `get_timeline_memes(years_ago, limit)` Supabase function | BE | 🔴 P0 | 2h | Backend |
| T-131 | Create `get_historical_timeline(start_date, end_date)` function | BE | 🟠 P1 | 2h | Backend |
| T-132 | Add date-based index on `memes.original_date` | BE | 🔴 P0 | 30m | Backend |

### 5.2 Flutter Timeline

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-140 | Create `TimelineBloc` to manage 3 timeline sections simultaneously | FE | 🔴 P0 | 3h | Flutter |
| T-141 | Build `TimelineScreen` with tabbed sections: "1 Year Ago", "2 Years Ago", "3 Years Ago" | FE | 🔴 P0 | 5h | Flutter |
| T-142 | Build `TimelineHeader` component with dynamic date display | FE | 🔴 P0 | 2h | Flutter |
| T-143 | Build horizontal swipe card carousel for each timeline section | FE | 🟠 P1 | 3h | Flutter |
| T-144 | Build full historical timeline (vertical scroll by month/year) | FE | 🟠 P1 | 5h | Flutter |
| T-145 | Implement pull-to-refresh for timeline updates | FE | 🟠 P1 | 1h | Flutter |
| T-146 | Add animated timeline connector (vertical line connecting years) | FE | 🟡 P2 | 2h | Flutter |

---

## Phase 6: Trending Memes (Week 6–7)

**Goal:** Real-time trending feed with external source integration.

### 6.1 Trend Collector Agent

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-150 | Implement Agent 001 (Trend Collector) as Supabase Edge Function | BE/AI | 🔴 P0 | 8h | Backend |
| T-151 | Integrate Reddit API (OAuth 2.0) for trending posts from r/memes, r/dankmemes | BE | 🔴 P0 | 4h | Backend |
| T-152 | Integrate YouTube Data API v3 for trending Shorts with meme tags | BE | 🟠 P1 | 3h | Backend |
| T-153 | Implement TikTok data aggregator (third-party service or scraper) | BE | 🟡 P2 | 6h | Backend |
| T-154 | Build deduplication pipeline using pHash comparison | BE | 🔴 P0 | 4h | Backend |
| T-155 | Set up cron job (every 6 hours) for trend collection | BE | 🔴 P0 | 1h | Backend |
| T-156 | Create admin upload interface (web-only) for manual meme curation | BE | 🟠 P1 | 6h | Backend |

### 6.2 Flutter Trending

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-160 | Create `TrendingBloc` with real-time Supabase subscription | FE | 🔴 P0 | 3h | Flutter |
| T-161 | Build `TrendingScreen` with ranked meme list | FE | 🔴 P0 | 4h | Flutter |
| T-162 | Build `TrendingMemeCard` with rank badge, source logo, rank change indicator | FE | 🟠 P1 | 3h | Flutter |
| T-163 | Build platform filter chips (All, Reddit, TikTok, YouTube, Admin) | FE | 🟡 P2 | 2h | Flutter |
| T-164 | Implement live refresh indicator ("Updated X minutes ago") | FE | 🟡 P2 | 1h | Flutter |
| T-165 | Build `TodayTrendReport` card on home screen | FE | 🟠 P1 | 2h | Flutter |

---

## Phase 7: AI Features (Week 8–11)

**Goal:** Full AI pipeline — analysis, explanation, similarity, viral prediction, trend reports.

### 7.1 Groq API Integration

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-170 | Create Groq API client wrapper in Edge Functions (rate limiting, retry) | BE/AI | 🔴 P0 | 4h | Backend |
| T-171 | Implement response caching strategy for Groq calls (Supabase tables) | BE/AI | 🔴 P0 | 2h | Backend |
| T-172 | Create structured prompt templates for all agent types | AI | 🔴 P0 | 4h | AI |
| T-173 | Set up Groq API key management via Supabase secrets | BE | 🔴 P0 | 30m | Backend |

### 7.2 Meme Analysis Agent (Agent 002)

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-180 | Implement Agent 002 Edge Function | BE/AI | 🔴 P0 | 6h | Backend |
| T-181 | Integrate image analysis prompt with Groq vision | AI | 🔴 P0 | 3h | AI |
| T-182 | Implement structured JSON response parser with validation | BE | 🔴 P0 | 2h | Backend |
| T-183 | Set up event trigger: analysis on new meme insert | BE | 🔴 P0 | 1h | Backend |

### 7.3 Meme Explanation Agent (Agent 003)

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-190 | Implement Agent 003 Edge Function with caching | BE/AI | 🔴 P0 | 5h | Backend |
| T-191 | Create bilingual prompt (EN + ID output in single call) | AI | 🔴 P0 | 2h | AI |
| T-192 | Build Flutter `ExplanationCard` widget (expandable, tabbed EN/ID) | FE | 🔴 P0 | 4h | Flutter |
| T-193 | Implement explanation loading skeleton (shimmer) | FE | 🟠 P1 | 1h | Flutter |
| T-194 | Add thumbs up/down feedback on explanation quality | FE | 🟠 P1 | 2h | Flutter |
| T-195 | Create `ExplanationBloc` with on-demand fetch and cache | FE | 🔴 P0 | 3h | Flutter |

### 7.4 Similarity Agent (Agent 004)

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-200 | Implement Agent 004 Edge Function (embedding generation) | BE/AI | 🟠 P1 | 5h | Backend |
| T-201 | Create `search_similar_memes(meme_id, limit)` pgvector function | BE | 🟠 P1 | 2h | Backend |
| T-202 | Build Flutter `SimilarMemesRow` horizontal scroll widget | FE | 🟠 P1 | 3h | Flutter |
| T-203 | Create `SimilarBloc` with pre-fetch on meme detail open | FE | 🟠 P1 | 2h | Flutter |

### 7.5 Viral Prediction Agent (Agent 005)

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-210 | Implement Agent 005 Edge Function with scoring logic | BE/AI | 🟠 P1 | 6h | Backend |
| T-211 | Create `ViralScoreGauge` animated Flutter widget | FE | 🟠 P1 | 3h | Flutter |
| T-212 | Build viral prediction section on meme detail screen | FE | 🟠 P1 | 2h | Flutter |
| T-213 | Set up daily cron for batch viral prediction updates | BE | 🟠 P1 | 1h | Backend |

### 7.6 Analytics Agent (Agent 007)

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-220 | Implement Agent 007 Edge Function (daily trend report generation) | BE/AI | 🟠 P1 | 5h | Backend |
| T-221 | Build `TrendReportScreen` with daily summary | FE | 🟠 P1 | 4h | Flutter |
| T-222 | Build `TrendReportCard` widget for home screen | FE | 🟠 P1 | 2h | Flutter |

### 7.7 Moderation Agent (Agent 006)

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-230 | Implement Agent 006 Edge Function with Groq Guard integration | BE/AI | 🔴 P0 | 6h | Backend |
| T-231 | Create moderation queue table and admin review interface | BE | 🟠 P1 | 4h | Backend |
| T-232 | Build admin notification system for flagged content | BE | 🟠 P1 | 2h | Backend |

---

## Phase 8: UI Polish & Complete Screens (Week 12–14)

**Goal:** Complete all screens, navigation, animations, and responsive design.

### 8.1 Navigation & Screens

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-240 | Build `HomeScreen` with sections: Trending, Timeline preview, Trend Report | FE | 🔴 P0 | 6h | Flutter |
| T-241 | Build `BottomNavigationBar` with: Home, Search, Timeline, Trending, Profile | FE | 🔴 P0 | 2h | Flutter |
| T-242 | Build `ProfileScreen` with: avatar, stats, bookmarks tab | FE | 🟠 P1 | 4h | Flutter |
| T-243 | Build `BookmarksScreen` with grid layout and swipe-to-remove | FE | 🟠 P1 | 3h | Flutter |
| T-244 | Build `SettingsScreen`: theme toggle, language picker, account management | FE | 🟠 P1 | 3h | Flutter |
| T-245 | Implement responsive layout for tablet (2-column) and desktop (3-column) | FE | 🟠 P1 | 6h | Flutter |

### 8.2 Animations & Polish

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-250 | Implement page transition animations (fade + slide) | FE | 🟡 P2 | 2h | Flutter |
| T-251 | Add shimmer loading skeletons on all list/grid screens | FE | 🟠 P1 | 3h | Flutter |
| T-252 | Implement pull-to-refresh with custom animation | FE | 🟠 P1 | 2h | Flutter |
| T-253 | Add Lottie animation for empty states | FE | 🟡 P2 | 2h | Flutter |
| T-254 | Implement image hero transitions between list and detail | FE | 🟡 P2 | 2h | Flutter |
| T-255 | Add haptic feedback on key interactions (bookmark, vote) | FE | 🟡 P2 | 1h | Flutter |

### 8.3 Localization Completion

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-260 | Audit all text strings and ensure 100% ARB coverage | FE | 🔴 P0 | 4h | Flutter |
| T-261 | Native speaker review of all Indonesian translations | QA | 🔴 P0 | 3h | QA |
| T-262 | Implement RTL layout support (future-proofing) | FE | 🟡 P2 | 2h | Flutter |

---

## Phase 9: Testing & Deployment (Week 15–18)

**Goal:** Full test coverage, performance optimization, and production deployment.

### 9.1 Testing

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-270 | Write unit tests for all Riverpod notifiers/providers | QA | 🔴 P0 | 12h | QA |
| T-271 | Write unit tests for all Repository classes | QA | 🔴 P0 | 8h | QA |
| T-272 | Write widget tests for all custom components | QA | 🟠 P1 | 10h | QA |
| T-273 | Write integration tests for critical user flows | QA | 🔴 P0 | 8h | QA |
| T-274 | Performance testing: load testing Supabase with k6 | QA | 🟠 P1 | 4h | QA |
| T-275 | Accessibility audit (screen reader, color contrast, touch targets) | QA | 🟠 P1 | 4h | QA |
| T-276 | Cross-device testing: multiple Android/iOS devices | QA | 🔴 P0 | 6h | QA |
| T-277 | Browser compatibility testing (Chrome, Safari, Firefox) | QA | 🟠 P1 | 3h | QA |
| T-278 | Security audit: SQL injection, XSS, RLS policy testing | QA | 🔴 P0 | 6h | QA |

### 9.2 Performance Optimization

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-280 | Image optimization: WebP conversion, lazy loading, CDN configuration | OPS | 🟠 P1 | 4h | DevOps |
| T-281 | Flutter web: code splitting and tree shaking optimization | FE | 🟠 P1 | 3h | Flutter |
| T-282 | Supabase query optimization: EXPLAIN ANALYZE on all main queries | BE | 🟠 P1 | 4h | Backend |
| T-283 | Implement client-side caching strategy (SWR pattern) | FE | 🟠 P1 | 3h | Flutter |

### 9.3 Deployment

| ID | Task | Type | Priority | Estimate | Owner |
|---|---|---|---|---|---|
| T-290 | Deploy Supabase migrations to production | OPS | 🔴 P0 | 2h | DevOps |
| T-291 | Configure custom domain for web app + SSL | OPS | 🔴 P0 | 2h | DevOps |
| T-292 | Submit Android app to Play Store (internal → beta → production) | OPS | 🔴 P0 | 4h | DevOps |
| T-293 | Submit iOS app to App Store (TestFlight → production) | OPS | 🔴 P0 | 4h | DevOps |
| T-294 | Configure monitoring: Supabase dashboards, Sentry alerts | OPS | 🟠 P1 | 2h | DevOps |
| T-295 | Set up Supabase Pro plan for production (connection pooling, backups) | OPS | 🟠 P1 | 1h | DevOps |
| T-296 | Create runbook for common operational tasks | OPS | 🟡 P2 | 3h | DevOps |
| T-297 | Conduct launch readiness review against PRD checklist | QA | 🔴 P0 | 2h | All |

---

## Summary

| Phase | Duration | Total Tasks | P0 Tasks |
|---|---|---|---|
| Phase 1: Setup | 2 weeks | 36 | 22 |
| Phase 2: Auth | 1.5 weeks | 23 | 13 |
| Phase 3: Database | 1.5 weeks | 26 | 16 |
| Phase 4: Search | 2 weeks | 20 | 10 |
| Phase 5: Timeline | 1.5 weeks | 14 | 7 |
| Phase 6: Trending | 2 weeks | 16 | 8 |
| Phase 7: AI Features | 4 weeks | 63 | 28 |
| Phase 8: UI Polish | 3 weeks | 23 | 5 |
| Phase 9: Testing & Deploy | 3 weeks | 28 | 13 |
| **Total** | **~18 weeks** | **249** | **122** |
