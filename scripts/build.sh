#!/usr/bin/env bash
set -e

echo "🚀 Building Board Ơi..."
flutter analyze
flutter test
flutter build ios --simulator --debug --no-codesign
echo "✅ Build completed successfully!"
