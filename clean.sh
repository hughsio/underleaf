#!/bin/bash

# Remove LaTeX auxiliary files generated during compilation.
rm -f report.{aux,bbl,bcf,blg,log,run.xml,toc,out,fls,fdb_latexmk,synctex.gz}

echo "Cleaned build artifacts."
