#!/usr/bin/env sh
set -eu

echo "Running lightweight verification..."

if [ -f "package.json" ]; then
  if command -v npm >/dev/null 2>&1; then
    npm test
  else
    echo "npm not found; skipping npm test"
  fi
fi

if [ -f "pom.xml" ]; then
  if command -v mvn >/dev/null 2>&1; then
    mvn test
  else
    echo "mvn not found; skipping mvn test"
  fi
fi

if [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
  if [ -x "./gradlew" ]; then
    ./gradlew test
  elif command -v gradle >/dev/null 2>&1; then
    gradle test
  else
    echo "gradle not found; skipping gradle test"
  fi
fi

echo "Lightweight verification complete."

