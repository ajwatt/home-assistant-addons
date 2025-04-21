#!/usr/bin/with-contenv bashio

STARTSOUND="$(bashio::config 'startup_sound')"

apk add --no-cache alsa-utils
#aplay /addons/hassio-spakerphat.old/LGsong-chorus.wav
clear
echo "Root dir:"
ls -l /
aplay /$STARTSOUND
