FROM texlive/texlive:latest

RUN apt-get update && apt-get install -y \
    latexmk \
    biber \
    && apt-get clean

WORKDIR /workspace

CMD ["/bin/bash"]
