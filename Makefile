# Makefile for Underleaf - Portable LaTeX Build

# File names
TEXFILE = report.tex
PDFFILE = report.pdf

# Commands
BUILD_CMD = ./build.sh
CLEAN_CMD = ./clean.sh

.PHONY: all build clean docker docker-shell

# Default target
all: build

# Build LaTeX project
build:
	@echo "🔨 Building LaTeX project..."
	$(BUILD_CMD)

# Clean auxiliary files
clean:
	@echo "🧹 Cleaning LaTeX build artifacts..."
	$(CLEAN_CMD)

# Run in Docker container (interactive shell)
docker:
	docker run --rm -it -v $(shell pwd):/workspace underleaf

# Drop into shell inside Docker (for debugging)
docker-shell:
	docker run --rm -it -v $(shell pwd):/workspace underleaf /bin/bash
