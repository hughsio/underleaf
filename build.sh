#!/bin/bash

# Optional: cleanup
rm -f report.{aux,bbl,bcf,blg,log,run.xml,toc}

# Docker compile with biber
docker run --rm \
  -v "/Users/hugh/Documents/Senior Project I (FALL 2024)Final Report":/workdir \
  -w /workdir \
  texlive/texlive \
  