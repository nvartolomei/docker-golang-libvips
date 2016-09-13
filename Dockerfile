FROM golang:1.7

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      automake build-essential pkg-config \
      libglib2.0-dev gobject-introspection libxml2-dev libjpeg62-turbo-dev libpng12-dev && \

    curl -O http://www.vips.ecs.soton.ac.uk/supported/8.3/vips-8.3.3.tar.gz && \
    tar zvxf vips-8.3.3.tar.gz && \
    cd vips-8.3.3 && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \


    apt-get remove -y automake build-essential pkg-config && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
