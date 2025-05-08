ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk update && \
  apk add --no-cache --virtual "PulseAudio" \
    alsa-utils

# Copy data for add-on
COPY root/ /root/
COPY run.sh /
RUN \
  chmod a+x /root/soundtest.sh; \
  chmod a+x /run.sh

# Install Pivumeter dependencies
RUN \
  apk add --no-cache --virtual "Pivumeter dependencies" \
    build-base \
    autoconf \
    autoconf-archive \
    automake \
    libtool \
    make \
    cmake \
    m4 \
    git \
    pulseaudio \
    pulseaudio-dev

# Build patched WiringPi
RUN \
  cd /root && \
  git clone --branch 3.14 --single-branch https://github.com/WiringPi/WiringPi.git
COPY WiringPi/patches /root/WiringPi/wiringPi
RUN \
  cd /root/WiringPi/wiringPi && \
  patch -u -b wiringPi.c -i wiringPi.c.patch && \
  patch -u -b Makefile -i Makefile.patch && \
  make install && \
  cp libwiringPi.so.3.14 /usr/local/lib && \
  cd /usr/local/lib && \
  ln -s libwiringPi.so.3.14 libwiringPi.so && \
  ldconfig /etc/ld.so.conf.d; echo $? && \
  cd /

# Build Pivumeter library
RUN \
  cd /root && \
  git clone https://github.com/pimoroni/pivumeter && \
  cd pivumeter && \
  aclocal && libtoolize && \
  autoupdate && autoconf && automake --add-missing && \
  ./configure && make && \
  make install 

#COPY libpivumeter.a /usr/local/lib
#COPY libpivumeter.la /usr/local/lib
#COPY libpivumeter.so.0.0.0 /usr/local/lib
#RUN \
#  ln -s /usr/local/lib/libpivumeter.so.0.0 /usr/local/lib/libpivumeter.so \
#  ln -s /usr/local/lib/libpivumeter.so.0.0 /usr/local/lib/libpivumeter.so.0

CMD [ "/run.sh" ]
