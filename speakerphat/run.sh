#!/usr/bin/with-contenv bashio

STARTSOUND="$(bashio::config 'startup_sound')"

apk add --no-cache alsa-utils
#aplay /addons/hassio-spakerphat.old/LGsong-chorus.wav
pwd
ls -l /data
ls -l /etc
aplay /data/$STARTSOUND
