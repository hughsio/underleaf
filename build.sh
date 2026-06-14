#!/bin/bash
set -e

# Compile LaTeX project with biber for bibliography support.
# Run this from the directory containing your report.tex file.

docker run --rm \
  -v "$(pwd)":/workdir \
  -w /workdir \
  texlive/texlive \
  /bin/bash -c "pdflatex report.tex && biber report && pdflatex report.tex && pdflatex report.tex"
