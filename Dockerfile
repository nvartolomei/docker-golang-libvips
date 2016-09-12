FROM golang:1.7

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      socat \
      libvips-dev \
      libgsf-1-dev \
    && rm -rf /var/lib/apt/lists/*
