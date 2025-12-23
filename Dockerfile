FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl xdg-utils git \
    build-essential cmake libclang-dev pkg-config \
    nodejs npm \
    libfontconfig1-dev \
    zstd \
    texlive-full \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -m cursor
USER cursor
ENV HOME=/home/cursor \
    PATH=/home/cursor/.local/bin:/home/cursor/.cargo/bin:/home/cursor/.elan/bin:$PATH

WORKDIR /workspace
