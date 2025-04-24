#!/usr/bin/with-contenv bashio

STARTSOUND="$(bashio::config 'startup_sound')"

apk add --no-cache alsa-utils
aplay /$STARTSOUND

while :
do
    echo "."
    sleep 60
done
