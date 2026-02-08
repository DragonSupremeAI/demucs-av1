#!/bin/bash
set -e

BASE="$(cd "$(dirname "$0")/.." && pwd)"
INPUT_DIR="$BASE/input"

for f in "$INPUT_DIR"/*.wav; do
  echo "▶️ Processing: $(basename "$f")"
  ./run-demucs.sh "$(basename "$f")"
done

echo "✅ Batch complete."
