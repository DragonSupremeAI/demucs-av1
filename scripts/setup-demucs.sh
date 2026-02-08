#!/bin/bash
set -e

BASE="$(cd "$(dirname "$0")/.." && pwd)"

VENV="$BASE/venv"
SRC="$BASE/demucs-src"
INPUT="$BASE/input"

echo "🔧 Installing system dependencies..."
sudo apt update && sudo apt install -y \
  python3 python3-venv python3-pip \
  ffmpeg curl git tree

echo "🐍 Creating Python virtual environment..."
python3 -m venv "$VENV"
source "$VENV/bin/activate"

echo "⬆️ Upgrading pip..."
pip install --upgrade pip

echo "🧩 Installing NumPy compatibility..."
pip install 'numpy<2.0'

echo "⚡ Installing CUDA PyTorch..."
pip install torch torchvision torchaudio \
  --index-url https://download.pytorch.org/whl/cu118

echo "🎙️ Installing Demucs from source..."
if [ ! -d "$SRC/demucs" ]; then
  git clone https://github.com/facebookresearch/demucs.git "$SRC/demucs"
fi

cd "$SRC/demucs"
pip install -e .

echo "🖥️ GPU Check..."
python3 -c "import torch; print('GPU:', torch.cuda.get_device_name(0)) if torch.cuda.is_available() else print('❌ No GPU detected')"

echo ""
echo "✅ Setup complete."
echo "🎧 Drop WAV files into: $INPUT"
