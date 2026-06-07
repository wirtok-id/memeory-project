
<div align="center">

### WARN:THIS APP OR THIS WEB IS STILL UNDER DEVELOPMENT

# 🎭 Memeory

### Relive the Internet's Funniest Memories

[![Flutter](https://img.shields.io/badge/Flutter-3.22+-02569B?logo=flutter)](https://flutter.dev)
[![Supabase](https://img.shields.io/badge/Supabase-2.x-3ECF8E?logo=supabase)](https://supabase.com)
[![Groq](https://img.shields.io/badge/Groq-AI_Powered-F55036)](https://groq.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Build Status](https://github.com/your-org/memeory/actions/workflows/ci.yml/badge.svg)](https://github.com/your-org/memeory/actions)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

**Web • 🚧 Android • 🚧 iOS** 
🇮🇩 Indonesian • 🌍 English

[![GitHub Pages Demo](https://wirtok-id.github.io/memeory-project/) • 🚧 Android Not Yet • 🚧 iOS Not Yet • Report Bug • Request Feature

</div>

---

## 📖 Overview

**Memeory** is an open-source cross-platform meme discovery platform built with Flutter. It lets users explore memes from previous years, compare them with current trends, and understand the cultural context behind internet's most iconic moments — all powered by AI.

Whether you're a nostalgic internet veteran, a content creator tracking trends, or someone who just encountered a meme they don't understand, Memeory has you covered.

```
🕰️  What was trending exactly 1 year ago today?
🔍  Search any meme by title, tag, year, or category
🤖  Get AI-powered explanations in English or Indonesian
📈  See viral potential predictions before they blow up
🌊  Discover similar memes through vector similarity search
```

---

## ✨ Features

### Feature	Status

🔍 Meme Search	📋 Planned
🕰️ Meme Timeline	📋 Planned
🔥 Trending Feed	📋 Planned
🤖 AI Explanation	📋 Planned
🔗 Similar Memes	📋 Planned
📊 Trend Reports	📋 Planned
🎯 Viral Prediction	📋 Planned
🌗 Dark / Light Mode	🚧 In Development
🌐 Bilingual	🚧 In Development
🔖 Bookmarks	📋 Planned
👤 Authentication	🚧 In Development
📺 YouTube Integration	🚧 In Development
👽 Reddit Integration	📋 Planned
🎵 TikTok Integration	📋 Planned
📤 User Uploads	📋 Planned

✅ Supabase Integration
✅ GitHub Pages Deployment
✅ Flutter Web Build
### Platform Support

## Platform	Status

Web	✅ Available
Android	🚧 Not Yet
iOS	🚧 Not Yet

---

## 🛠️ Tech Stack

### Frontend
- **[Flutter](https://flutter.dev)** 3.22+ — Cross-platform UI framework
- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** — State management (BLoC pattern)
- **[go_router](https://pub.dev/packages/go_router)** — Declarative routing + deep links
- **[flutter_animate](https://pub.dev/packages/flutter_animate)** — Smooth animations
- **[cached_network_image](https://pub.dev/packages/cached_network_image)** — Image caching

### Backend
- **[Supabase](https://supabase.com)** — Database (PostgreSQL), Auth, Storage, Edge Functions
- **[pgvector](https://github.com/pgvector/pgvector)** — Vector similarity search for memes
- **Supabase Realtime** — Live trending updates

### AI

• Groq API — 📋 Planned
• AI Agents — 📋 Planned

### DevOps

• GitHub — ✅
• GitHub Pages — ✅
• GitHub Actions — 📋 Planned
• Fastlane — 📋 Planned
• Sentry — 📋 Planned

---

## 🚀 Quick Start

### Prerequisites

| Tool | Version | Install |
|---|---|---|
| Flutter | ≥ 3.22.0 | [flutter.dev/docs/get-started](https://flutter.dev/docs/get-started) |
| Dart | ≥ 3.4.0 | Included with Flutter |
| Node.js | ≥ 20.x | [nodejs.org](https://nodejs.org) |
| Supabase CLI | ≥ 1.170.0 | `npm install -g supabase` |
| Git | Any | [git-scm.com](https://git-scm.com) |

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/your-org/memeory.git
cd memeory
```

**2. Install Flutter dependencies**

```bash
flutter pub get
```

**3. Generate code (models, DI, localization)**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

**4. Configure environment variables**

```bash
cp .env.example .env
```

Edit `.env` with your credentials (see [Environment Variables](#-environment-variables)).

**5. Start Supabase locally**

```bash
supabase start
supabase db push
supabase db seed
```

**6. Deploy Edge Functions (locally)**

```bash
supabase functions serve
```

**7. Run the app**

```bash
# Mobile (Android)
flutter run -d android

# Mobile (iOS)
flutter run -d ios

# Web
flutter run -d chrome

# With specific flavor
flutter run --dart-define-from-file=.env
```

---

## 🗄️ Database Setup

Memeory uses Supabase (PostgreSQL) with pgvector for similarity search.

```bash
# Apply all migrations
supabase db push

# Run seed data (1000 sample memes)
supabase db seed

# Open Supabase Studio
supabase studio
```

See [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md) for full schema documentation.

---

## 🔑 Environment Variables

Copy `.env.example` to `.env` and fill in all values:

```bash
cp .env.example .env
```
### API key
SUPABASE_URL ✅
SUPABASE_ANON_KEY ✅

YOUTUBE_API_KEY 📋 Planned
GOOGLE_CLIENT_ID 📋 Planned
REDDIT_CLIENT_ID 📋 Planned
REDDIT_CLIENT_SECRET 📋 Planned
GROQ_API_KEY 📋 Planned
SENTRY_DSN 📋 Planned

---

## 📁 Project Structure

```
memeory/
├── lib/
│   ├── core/          # App-wide utilities, themes, constants
│   ├── features/      # Feature modules (auth, search, timeline, etc.)
│   ├── shared/        # Shared widgets and models
│   └── main.dart      # App entry point
├── supabase/
│   ├── migrations/    # Database migration files
│   ├── functions/     # Edge Functions (AI agents)
│   └── seed.sql       # Seed data
├── test/              # Unit, widget, and integration tests
└── docs/              # Documentation
```

See [FOLDER_STRUCTURE.md](FOLDER_STRUCTURE.md) for the complete structure.

---

## 🧪 Testing

```bash
# Run all unit tests
flutter test

# Run with coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html

# Run integration tests
flutter test integration_test/

# Run specific test file
flutter test test/features/search/search_bloc_test.dart

# Supabase Edge Function tests
cd supabase/functions && deno test
```

---

## 📦 Deployment

### Web

```bash
flutter build web --release --dart-define-from-file=.env
# Deploy to Vercel / Netlify / Firebase Hosting
```

### Android

```bash
# Build APK
flutter build apk --release --dart-define-from-file=.env

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release --dart-define-from-file=.env

# Automated via Fastlane
fastlane android deploy
```

### iOS

```bash
flutter build ios --release --dart-define-from-file=.env

# Automated via Fastlane
fastlane ios deploy
```

### Supabase (Production)

```bash
# Push database migrations
supabase db push --project-ref YOUR_PROJECT_REF

# Deploy all Edge Functions
supabase functions deploy --project-ref YOUR_PROJECT_REF

# Set production secrets
supabase secrets set GROQ_API_KEY=your_key --project-ref YOUR_PROJECT_REF
```

---
### RoadMap
Current: v0.1 Foundation

✅ Flutter project setup
✅ GitHub repository
✅ GitHub Pages deployment
✅ Supabase integration
✅ Environment configuration
✅ Core architecture

🚧 Authentication
🚧 Database schema
🚧 YouTube integration

📋 Meme search
📋 Meme timeline
📋 Trending feed
📋 Reddit integration
📋 TikTok integration
📋 AI explanation
📋 Similar memes
📋 Viral prediction
📋 Bookmarks
📋 Community uploads
📋 Android release
📋 iOS release
---

## 🤝 Contributing

We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) first.

```bash
# Fork and clone
git clone https://github.com/your-username/memeory.git

# Create feature branch
git checkout -b feature/amazing-feature

# Make changes, add tests
# ...

# Run tests
flutter test

# Commit with conventional commits
git commit -m "feat: add amazing feature"

# Push and create PR
git push origin feature/amazing-feature
```

### Contribution Guidelines

- Follow [CODING_STANDARDS.md](CODING_STANDARDS.md)
- Write tests for all new features
- Keep PRs focused and small
- Use conventional commit messages
- Update documentation for user-facing changes

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgements

- [Flutter Team](https://flutter.dev) — The amazing cross-platform framework
- [Supabase](https://supabase.com) — The open-source Firebase alternative
- [Groq](https://groq.com) — Blazing fast LLM inference
- All the meme creators across the internet 🫡

---

### 📬 Contact

Website: 🚧 Not Yet
Email: 🚧 Not Yet
Twitter/X: 🚧 Not Yet
Discord: 🚧 Not Yet

For bug reports, feature requests, or questions, please open a GitHub Issue.

---

<div align="center">
  Made with ❤️ and memes • 🚧 Official Website Coming Soon 
</div>
=======
# memeory-project
Platform untuk menemukan, memahami, dan menjelajahi sejarah meme internet dengan bantuan AI.
 (Initial commit)
