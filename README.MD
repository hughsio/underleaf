# Underleaf

> A portable LaTeX authoring environment powered by Docker and VS Code — no local TeX Live installation required.

---

## What is Underleaf?

Underleaf wraps a full TeX Live distribution in Docker so you can write, compile, and version-control LaTeX documents on any machine. Clone the repo, run one command, and get a reproducible PDF — every time.

**Great for:** research papers, technical reports, theses, and any document where formatting precision matters.

---

## Requirements

- [Docker](https://www.docker.com/) (running)
- [VS Code](https://code.visualstudio.com/) + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) *(optional, for editor support)*

---

## Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/hughsio/underleaf.git
cd underleaf

# 2. Build the Docker image (one-time setup)
docker build -t underleaf .

# 3. Compile the starter document
./build.sh
# → report.pdf appears in the current directory
```

That's it. Edit `report.tex`, run `./build.sh` again, repeat.

---

## Project Structure

```
underleaf/
├── Dockerfile          # TeX Live image with latexmk + biber
├── Makefile            # Convenience targets
├── build.sh            # Compile report.tex via Docker
├── clean.sh            # Remove LaTeX auxiliary files
├── report.tex          # Starter document — edit this
├── references.bib      # Bibliography entries (BibLaTeX format)
└── .gitignore          # Excludes PDFs and build artifacts
```

---

## Commands

| Command | What it does |
|---|---|
| `./build.sh` | Compile `report.tex` → `report.pdf` inside Docker |
| `make build` | Same as above via Makefile |
| `make clean` | Delete `.aux`, `.log`, `.bbl`, and other artifacts |
| `make docker` | Open an interactive shell in the container |
| `make docker-shell` | Same — useful for running LaTeX commands manually |

---

## Customizing Your Document

**Edit the source files:**

- `report.tex` — main document; change the title, author, and content
- `references.bib` — add bibliography entries in BibTeX format
- `images/` — put figures here and reference them with `\includegraphics{images/yourfile}`

**Change the citation style** by editing the `biblatex` options in `report.tex`:

```latex
% IEEE numbered references (default)
\usepackage[style=ieee, backend=biber]{biblatex}

% APA author-year references
\usepackage[style=apa, backend=biber]{biblatex}
```

**Rename the main file** from `report.tex` to something else — update the filename in `build.sh`, `clean.sh`, and `Makefile`.

---

## How the Build Works

`build.sh` mounts the current directory into the Docker container and runs a full LaTeX compile cycle:

```
pdflatex  →  biber  →  pdflatex  →  pdflatex
```

Three passes are needed: the first generates structure, `biber` processes bibliography, and the final two passes resolve cross-references and citations.

---

## VS Code Tips

- Install [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) for syntax highlighting, autocomplete, and PDF preview
- Configure LaTeX Workshop to use `latexmk` + `biber` to match the Docker build
- Keep your `.tex` and `.bib` files committed; the `.gitignore` already excludes generated PDFs and build artifacts

---

## License

MIT — fork freely.
