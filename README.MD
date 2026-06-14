# Underleaf: LaTeX Authoring in VS Code with Docker

**Underleaf** is a minimal, portable LaTeX environment powered by Docker. It lets you write and compile LaTeX documents without installing TeX Live on your machine — ideal for students, researchers, and professionals who want reproducible, version-controlled document builds.

---

## Project Structure

```
├── Dockerfile          # Docker image with TeX Live + latexmk + biber
├── Makefile            # Convenience targets for build, clean, and Docker
├── build.sh            # Compile report.tex inside Docker
├── clean.sh            # Remove LaTeX auxiliary build files
├── report.tex          # Starter LaTeX document (edit this)
├── references.bib      # BibLaTeX bibliography file
└── .gitignore          # Ignores LaTeX artifacts and PDFs
```

---

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/) installed and running
- (Optional) [VS Code](https://code.visualstudio.com/) with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension for syntax highlighting

### 1. Build the Docker Image

```bash
docker build -t underleaf .
```

### 2. Compile Your Document

From your project directory:

```bash
./build.sh
```

This mounts the current directory into the container and runs:
`pdflatex → biber → pdflatex → pdflatex`

The output `report.pdf` will appear in the same directory.

Or use the Makefile:

```bash
make build
```

### 3. Clean Build Artifacts

```bash
make clean
```

### 4. Open an Interactive Shell in Docker

Useful for running individual LaTeX commands manually:

```bash
make docker-shell
```

---

## Customizing Your Document

- Edit `report.tex` with your content
- Add bibliography entries to `references.bib`
- Place images in an `images/` subdirectory and reference them with `\includegraphics`
- Change the citation style in `report.tex` by modifying the `biblatex` style option (e.g., `style=ieee`, `style=apa`)

---

## Tips

- Run `build.sh` from inside the Docker container (via `make docker-shell`) or let `build.sh` handle Docker for you — do not run `pdflatex` directly on the host
- To rename the main file from `report.tex`, update the references in `build.sh`, `clean.sh`, and `Makefile`
- The `.gitignore` excludes PDFs and auxiliary files — commit only source files

---

## License

MIT License
