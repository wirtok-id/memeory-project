# RULES.md

## Mandatory Reading Order

Before making any changes, always read:

1. PRD.md
2. TASKS.md
3. AGENTS.md
4. DATABASE_SCHEMA.md
5. API_SPEC.md
6. README.md

Never start implementation without understanding these files.

---

## Project Goal

Memeory is a platform for discovering, understanding, searching, and tracking meme history and trends.

Platforms:
- Web
- Android
- iOS

Languages:
- Indonesian
- English

---

## Development Workflow

1. Read TASKS.md
2. Find highest priority unfinished task
3. Implement task completely
4. Run tests and analysis
5. Update TASKS.md
6. Commit changes

Never skip unfinished tasks.

---

## Architecture Rules

Required Stack:

- Flutter
- Riverpod
- GoRouter
- Supabase
- Clean Architecture

Feature Structure:

features/
├── auth/
├── search/
├── trending/
├── meme_detail/
├── profile/
├── bookmarks/
├── ai/
└── settings/

Each feature must contain:

- presentation
- application
- domain
- data

---

## UI Rules

Design Style:

- Modern
- Futuristic
- Premium
- Startup Quality

Inspired by:

- Linear
- Arc Browser
- Spotify
- Threads
- Raycast

Requirements:

- Dark mode first
- Glassmorphism
- Gradient accents
- Smooth animations
- Skeleton loaders
- Responsive layouts
- Beautiful empty states
- Consistent spacing

Do NOT use default Material styling.

---

## Code Quality Rules

Required:

- Null Safety
- Strong typing
- Lint clean
- Production ready

Use:

- freezed
- json_serializable
- Riverpod generators

Do NOT:

- leave TODOs
- leave placeholder code
- leave commented code
- use print()

Use logging services instead.

---

## Riverpod Rules

Use:

- Provider
- FutureProvider
- AsyncNotifier
- StateNotifier

Do NOT:

- create global mutable state
- use singleton patterns manually

All dependencies must be injected through Riverpod.

---

## Routing Rules

Use GoRouter only.

Requirements:

- Deep linking
- Route guards
- Authentication redirects

Avoid manual Navigator usage.

---

## Authentication Rules

Required:

- Email & Password
- Google Sign In
- Session Persistence
- Logout
- Forgot Password

All protected pages must require authentication.

---

## Supabase Rules

Use:

- Supabase Auth
- Supabase Database
- Supabase Storage
- Supabase Edge Functions

Required Buckets:

- meme-thumbnails
- meme-media
- avatars

Enable:

- RLS
- Proper policies

Never expose service role keys.

---

## Search Rules

Search must support:

- Meme title
- Tags
- Categories
- Year
- Trends

Required:

- Suggestions
- Search history
- Infinite scroll
- Loading states
- Error states

---

## AI Rules

Provider:

- Groq

Features:

1. Meme Explanation
2. Trend Summary
3. Similar Meme Search
4. Viral Prediction

Requirements:

- Caching
- Rate limiting
- Error handling

---

## Security Rules

Never:

- Hardcode secrets
- Hardcode API keys
- Commit .env

Use:

.env
.env.example

for all environment configuration.

---

## Testing Rules

Every completed feature must include:

- Unit Tests
- Widget Tests

Before completion run:

flutter analyze

flutter test

Both must pass.

---

## Git Rules

Branches:

- main
- develop
- feature/*

Commit format:

feat:
fix:
docs:
refactor:
test:
chore:

Examples:

feat(auth): add google sign in

fix(search): repair pagination

---

## Task Completion Rules

A task is COMPLETE only if:

- Feature works
- UI implemented
- Loading state exists
- Error handling exists
- Tests added
- TASKS.md updated

Otherwise task remains INCOMPLETE.