# Pinned TeX Live release for reproducible builds.
# TLxxxx-historic ties this image to a specific TeX Live year.
# Check https://hub.docker.com/r/texlive/texlive/tags for the latest historic tag.
# The full texlive/texlive image already includes latexmk and biber,
# so no extra apt-get install layer is needed.
FROM texlive/texlive:TL2025-historic

WORKDIR /workspace
CMD ["/bin/bash"]