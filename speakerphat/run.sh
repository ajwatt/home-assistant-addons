#!/usr/bin/with-contenv bashio

STARTSOUND="$(bashio::config 'startup_sound')"

#aplay /$STARTSOUND

while :
do
    echo "."
    sleep 60
done
