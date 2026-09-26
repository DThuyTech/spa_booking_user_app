.PHONY: get gen format analyze test check clean l10n

get:
	flutter pub get

l10n:
	flutter gen-l10n

gen:
	dart run build_runner build --delete-conflicting-outputs

format:
	dart format .

analyze:
	flutter analyze

test:
	flutter test

check:
	dart format --set-exit-if-changed .
	flutter analyze
	flutter test

clean:
	flutter clean
	flutter pub get
