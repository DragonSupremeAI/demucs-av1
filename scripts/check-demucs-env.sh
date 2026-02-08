#!/bin/bash
set -e

BASE="$(cd "$(dirname "$0")/.." && pwd)"

source "$BASE/venv/bin/activate"

echo ""
echo "🔍 Demucs Environment Check"
echo "--------------------------------"

echo "🐍 Python:"
python3 --version

echo ""
echo "📦 NumPy:"
python3 -c "import numpy; print(numpy.__version__)"

echo ""
echo "⚡ Torch + CUDA:"
python3 -c "import torch; print('Torch:', torch.__version__); print('CUDA Available:', torch.cuda.is_available())"

echo ""
echo "🎙️ Demucs CLI:"
command -v demucs && demucs --version || echo "❌ Demucs not found"

echo ""
echo "🎛️ FFmpeg:"
ffmpeg -version | head -n 1

echo ""
echo "✅ Environment OK"
