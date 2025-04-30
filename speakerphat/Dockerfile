ARG BUILD_FROM
# armhf: tianon/raspbian:${VERSION}-slim

FROM ${BUILD_FROM}

# Default ENV
ENV \
    LANG="C.UTF-8" \
    DEBIAN_FRONTEND="noninteractive" \
    CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt" \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_SERVICES_READYTIME=50

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Build Args
ARG \
    BASHIO_VERSION \
    TEMPIO_VERSION \
    S6_OVERLAY_VERSION \
    QEMU_CPU

# Base system
WORKDIR /usr/src

RUN \
    set -x \
    && apt-get update && apt-get install -y --no-install-recommends \
        bash \
        jq \
        tzdata \
        curl \
        ca-certificates \
        xz-utils 

# S6-Overlay
WORKDIR /
ENTRYPOINT ["/init"]

# Install requirements for add-on
#RUN \
#  apt-get install -y  --no-install-recommends \
#    alsa-utils \
#    pulseaudio-utils \
#    alsa-plugins-pulse

# Copy data for add-on
COPY .asoundrc /root/
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
