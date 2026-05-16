#!/usr/bin/env bash
set -euo pipefail

tmpfile=$(mktemp)

trap 'rm -f "$tmpfile"' EXIT

echo "Hello, World" > "$tmpfile"

cat "$tmpfile"

echo "$TestEnv"

echo "Hello, After wrong Env"