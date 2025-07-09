# 📄 Underleaf: LaTeX Report Authoring in VS Code with Docker

This repository—**Underleaf**—contains the setup and scripts used to author, render, and manage LaTeX documents inside a Dockerized environment using VS Code. It is ideal for students, researchers, or professionals who want to:

* Use LaTeX without installing TeX Live directly on their machine
* Easily build reproducible LaTeX environments
* Version control LaTeX projects with Git
* Maintain lightweight and portable LaTeX builds

---

## 🏗️ Project Structure

```
├── Dockerfile                # Docker image definition with full TeX Live
├── build.sh                  # Build script to compile LaTeX project
├── clean.sh                  # Script to remove build artifacts
├── references.bib            # BibLaTeX-compatible bibliography file
├── report.tex                # Your main LaTeX source file
├── images/                   # Folder containing embedded images
│   ├── landing.png
│   ├── welcome.png
│   └── ist.png
├── .gitignore                # Optional: git ignore rules for LaTeX artifacts
└── README.md                 # This file
```

---

## 🚀 Getting Started

### 1. Build the Docker Image

```bash
docker build -t underleaf .
```

### 2. Run the Container (One-Time or Repeated Use)

```bash
docker run --rm -it -v $(pwd):/workspace underleaf
```

This mounts your project into the container and starts an interactive shell.

### 3. Compile the LaTeX Project

Inside the container:

```bash
./build.sh
```

### 4. Clean Project (optional)

```bash
./clean.sh
```

---

## 🛠️ Setup Notes

* The `build.sh` script uses `latexmk` with `biber` as the backend for `biblatex`
* The Docker image installs:

  * `texlive-full`
  * `biber`
  * Essential LaTeX packages (e.g. `biblatex`, `csquotes`, `microtype`, `hyperref`, etc.)

---

## 📚 Bibliography

* Make sure your `.bib` file is properly formatted (e.g., APA or IEEE via `biblatex`)
* We recommend using `style=ieee` in `biblatex` for numbered references

---

## 🧼 Clean Builds

Use the provided `clean.sh` to remove auxiliary files and keep your repo clean:

```bash
./clean.sh
```

This removes:

* `.aux`, `.log`, `.toc`, `.out`, `.bbl`, `.blg`, etc.

---

## 🧠 Tips

* You can use VS Code’s LaTeX Workshop extension for editing and syntax highlighting
* For very large images or PDFs, compress them before including
* Always run `build.sh` inside the Docker container for consistency

---

## 📦 Future Enhancements

* Add `Makefile` for platform-independent building
* Enable PDF optimization post-processing
* Add support for multiple output formats (PDF, HTML)

---

## 🤝 Contributing

Feel free to fork and contribute improvements for handling bibliography styles, Docker optimizations, or tooling integrations.

---

## 🪪 License

MIT License

---

> **Underleaf**: Reproducible, portable, and professional LaTeX workflows in VS Code with Docker.
