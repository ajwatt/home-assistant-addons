ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    alsa-utils

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
COPY LGsong-chorus.wav /
COPY asound.conf /etc/

CMD [ "/run.sh" ]
