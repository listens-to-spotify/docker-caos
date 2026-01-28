# syntax=docker/dockerfile:1.7
FROM --platform=linux/amd64 ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-lc"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc g++ make cmake ninja-build \
    git curl wget ca-certificates pkg-config \
    gdb binutils nasm \
    strace ltrace file \
    less nano vim-tiny \
    python3 python3-pip python3-yaml \
    unzip zip \
    openssh-client \
    man-db manpages manpages-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /root
CMD ["bash"]
