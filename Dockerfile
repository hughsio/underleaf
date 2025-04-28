FROM texlive/texlive:latest

# Install latexmk (if not already included in your texlive image)
RUN apt-get update && apt-get install -y latexmk

WORKDIR /data
