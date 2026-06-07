FLUTTER ?= flutter
DART ?= dart

.PHONY: pub-get analyze test build-web gen-l10n format clean supabase-start supabase-functions

pub-get:
	$(FLUTTER) pub get

analyze:
	$(FLUTTER) analyze

test:
	$(FLUTTER) test

build-web:
	$(FLUTTER) build web --release --dart-define-from-file=.env

gen-l10n:
	$(FLUTTER) gen-l10n

format:
	$(DART) format lib test

clean:
	$(FLUTTER) clean

supabase-start:
	supabase start

supabase-functions:
	supabase functions serve
