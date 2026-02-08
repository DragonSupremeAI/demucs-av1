#!/bin/bash
set -e

BASE="$(cd "$(dirname "$0")/.." && pwd)"

SRC="$BASE/demucs-src/demucs"
INPUT_DIR="$BASE/input"
OUTPUT_DIR="$BASE/output"
LOG_DIR="$BASE/logs"

MODEL="htdemucs_ft"
SEGMENT=7.5

if [ -z "$1" ]; then
  echo "❌ Usage: ./run-demucs.sh your_audio.wav"
  exit 1
fi

INPUT_FILE="$INPUT_DIR/$1"

if [ ! -f "$INPUT_FILE" ]; then
  echo "❌ File not found: $INPUT_FILE"
  exit 1
fi

mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/demucs-$1.log"

source "$BASE/venv/bin/activate"
cd "$SRC"

echo "🚀 Running Demucs on $1..."
demucs -n "$MODEL" \
  --segment "$SEGMENT" \
  --two-stems=vocals \
  --out "$OUTPUT_DIR" \
  "$INPUT_FILE" | tee "$LOG_FILE"

echo ""
echo "✅ Done."
echo "🎧 Output in: $OUTPUT_DIR"
echo "📜 Log saved: $LOG_FILE"
