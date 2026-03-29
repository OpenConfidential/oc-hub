#!/usr/bin/env bash
set -euo pipefail
echo "Running oc-hub CI checks..."

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ ! -f "$ROOT_DIR/index.html" ]; then
  echo "ERROR: index.html not found at $ROOT_DIR/index.html"
  exit 1
fi

if [ ! -f "$ROOT_DIR/CNAME" ]; then
  echo "ERROR: CNAME not found at $ROOT_DIR/CNAME"
  exit 1
fi

domain=$(tr -d ' \n\r' < "$ROOT_DIR/CNAME")
if [ "$domain" != "openconfidential.ai" ]; then
  echo "ERROR: CNAME does not contain openconfidential.ai (found: '$domain')"
  exit 1
fi

if ! grep -qi "oc-hub" "$ROOT_DIR/index.html"; then
  echo "ERROR: index.html does not mention 'oc-hub'"
  exit 1
fi

echo "All checks passed."
