FROM golang:1.6

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      sudo \
      locales \
      socat \
      libvips-dev \
      libgsf-1-dev \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' ubuntu && \
    adduser ubuntu sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chown -R ubuntu:ubuntu /usr/local

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/ubuntu
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LOGNAME ubuntu
ENV TERM xterm a

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN dpkg-reconfigure locales

WORKDIR /home/ubuntu
USER ubuntu
