# Demucs AV1

A streamlined suite of scripts for managing [Facebook's Demucs](https://github.com/facebookresearch/demucs) audio source separation. This project provides automated setup, environment checking, and batch processing capabilities.

## 🚀 Quick Start

### 1. Setup
Run the setup script to install system dependencies (FFmpeg, Python venv, etc.) and configure the Python environment with CUDA support.

```bash
cd scripts
./master.sh setup
```

### 2. Add Audio Files
Place your `.wav` files into the `input/` directory.

### 3. Run Separation
You can process a single file or batch process everything in the `input/` folder.

**Single File:**
```bash
./master.sh run your_audio.wav
```

**Batch Mode:**
```bash
./master.sh batch
```

## 📂 Project Structure

- **`scripts/`**: Core automation scripts.
  - `master.sh`: Main entry point for all operations.
  - `setup-demucs.sh`: Installs system deps, creates venv, and installs Demucs.
  - `run-demucs.sh`: Processes a single audio file (default: `htdemucs_ft` model, vocals/no-vocals separation).
  - `batch-demucs.sh`: Iterates over all `.wav` files in `input/`.
  - `check-demucs-env.sh`: Verifies Python, Torch, CUDA, and FFmpeg installation.
- **`input/`**: Place your source audio files here.
- **`output/`**: Separated audio tracks will be saved here.
- **`logs/`**: Detailed logs of Demucs execution.
- **`demucs-src/`**: Local clone of the Demucs source code.
- **`venv/`**: Python virtual environment.

## ⚙️ Configuration

The default separation settings are defined in `scripts/run-demucs.sh`:
- **Model**: `htdemucs_ft`
- **Segment Length**: `7.5`
- **Output Mode**: `--two-stems=vocals` (extracts vocals and background tracks)

## 🛠 Requirements

- Linux (Ubuntu/Debian recommended)
- NVIDIA GPU with CUDA support (recommended for performance)
- FFmpeg
