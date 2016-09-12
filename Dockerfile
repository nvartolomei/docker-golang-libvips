FROM golang:1.7

RUN \
  apt-get clean && apt-get update && \
  apt-get install -y --no-install-recommends \
    automake build-essential wget unzip \
    gobject-introspection gtk-doc-tools libglib2.0-dev libjpeg62-turbo-dev \
    libpng12-dev libwebp-dev libtiff5-dev libexif-dev libxml2-dev swig libmagickwand-dev libpango1.0-dev \
    libmatio-dev libopenslide-dev libcfitsio3-dev && \

  # build libvips
  wget https://github.com/jcupitt/libvips/archive/master.zip && \
  unzip master.zip && \
  cd libvips-master && \
  ./autogen.sh && \
  ./configure --enable-debug=no --without-python --without-orc --without-fftw --without-gsf $1 && \
  make && \
  make install && \
  ldconfig && \

  # cleanup
  apt-get remove -y curl automake build-essential && \
  apt-get autoremove -y && \
  apt-get autoclean && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
