#!/usr/bin/with-contenv bashio

STARTSOUND="$(bashio::config 'startup_sound')"

apk add --no-cache alsa-utils
#aplay /addons/hassio-spakerphat.old/LGsong-chorus.wav
ls -l /*.wav
cat /etc/asound.conf
aplay -L
#aplay /$STARTSOUND

while :
do
    echo "."
    sleep 60
done
