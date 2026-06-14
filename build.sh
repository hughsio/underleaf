#!/bin/bash
set -euo pipefail

# Compile the LaTeX project using the pinned Underleaf image
# (built from the local Dockerfile — NOT the upstream texlive image directly).
# Run this from the directory containing your report.tex file.

IMAGE="underleaf"

# Build the pinned image on first run if it isn't present yet.
if ! docker image inspect "$IMAGE" >/dev/null 2>&1; then
  echo "Image '$IMAGE' not found — building it (one-time setup)..."
  docker build -t "$IMAGE" "$(dirname "$0")"
fi

docker run --rm \
  -v "$(pwd)":/workspace \
  -w /workspace \
  "$IMAGE" \
  /bin/bash -c "pdflatex report.tex && biber report && pdflatex report.tex && pdflatex report.tex"