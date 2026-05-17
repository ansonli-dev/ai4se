#!/usr/bin/env sh
set -eu

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <story-or-spec-file>" >&2
  exit 2
fi

file="$1"

if [ ! -f "$file" ]; then
  echo "Missing file: $file" >&2
  exit 2
fi

missing=0

for pattern in "Acceptance Criteria" "验收" "AI Context Boundary" "Traceability" "Story ID"; do
  if ! grep -qi "$pattern" "$file"; then
    echo "Missing required section or marker: $pattern"
    missing=1
  fi
done

if [ "$missing" -ne 0 ]; then
  exit 1
fi

echo "Story readiness check passed: $file"
