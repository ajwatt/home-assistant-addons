ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk update && \
  apk add --no-cache --virtual "ALSA" \
    alsa-utils \
    alsa-plugins-pulse

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
    linux-headers \
    autoconf \
    automake \
    libtool \
    alsa-lib-dev \
    fftw-dev \
    git

# Build patched WiringPi
RUN \
  cd /root && \
  git clone --branch 3.14 --single-branch https://github.com/WiringPi/WiringPi.git
COPY WiringPi/patches /root/WiringPi/wiringPi
RUN \
  cd WiringPi/wiringPi && \
  echo && \
  echo " FART " && \
  echo && \
  patch -u -b wiringPi.c -i wiringPi.c.patch && \
  patch -u -b Makefile -i Makefile.patch && \
  make install && \
  cp libwiringPi.so.3.14 /usr/local/lib && \
  cd /usr/local/lib && \
  ln -s libwiringPi.so.3.14 libwiringPi.so && \
  ldconfig /etc/ld.so.conf.d; echo $? && \
  cd /

CMD [ "echo fart" ]

#COPY libpivumeter.a /usr/local/lib
#COPY libpivumeter.la /usr/local/lib
#COPY libpivumeter.so.0.0.0 /usr/local/lib
#RUN \
#  ln -s /usr/local/lib/libpivumeter.so.0.0 /usr/local/lib/libpivumeter.so \
#  ln -s /usr/local/lib/libpivumeter.so.0.0 /usr/local/lib/libpivumeter.so.0

#CMD [ "/run.sh" ]
