iARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache --virtual speakerphat-dependencies \
    alsa-utils \
    espeak \
    wiringpi \
    python3 \
    py3-pip \
    py3-rpigpio \
    py3-smbus
    gcc \
    build-base \
    automake \
    autoconf \
    libtool \
    m4 \
    musl-dev \
    wiringpi-dev \
    alsa-lib-dev \
    fftw-dev \
    make
