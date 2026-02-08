#!/bin/bash
set -e

usage() {
  echo ""
  echo "🎛️ Demucs Command Center"
  echo ""
  echo "Usage:"
  echo "  ./master.sh setup"
  echo "  ./master.sh check"
  echo "  ./master.sh run <file.wav>"
  echo "  ./master.sh batch"
  echo ""
  exit 1
}

case "$1" in
  setup)
    ./setup-demucs.sh
    ;;
  check)
    ./check-demucs-env.sh
    ;;
  run)
    ./run-demucs.sh "$2"
    ;;
  batch)
    ./batch-demucs.sh
    ;;
  *)
    usage
    ;;
esac
