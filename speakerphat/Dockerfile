ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    alsa-utils \
    pulseaudio-utils \
    alsa-plugins-pulse

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
COPY LGsong-chorus.wav /
COPY soundtest.sh /
RUN \
  chmod +x soundtest.sh
#COPY libpivumeter.a /usr/local/lib
#COPY libpivumeter.la /usr/local/lib
#COPY libpivumeter.so.0.0.0 /usr/local/lib
#RUN \
#  ln -s /usr/local/lib/libpivumeter.so.0.0 /usr/local/lib/libpivumeter.so \
#  ln -s /usr/local/lib/libpivumeter.so.0.0 /usr/local/lib/libpivumeter.so.0

#CMD [ "/run.sh" ]

# Copy root filesystem
COPY rootfs /
