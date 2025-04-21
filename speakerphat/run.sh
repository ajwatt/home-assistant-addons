#!/usr/bin/with-contenv bashio

STARTSOUND="$(bashio::config 'startup_sound')"

apk add --no-cache alsa-utils
#aplay /addons/hassio-spakerphat.old/LGsong-chorus.wav
clear
echo "aplay:
"
aplay -L
cat /etc/asound.conf
#aplay /$STARTSOUND
