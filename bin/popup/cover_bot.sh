#!/usr/bin/env bash

# quit on error
set -e

# vars
#csf=$(mpc -f %file% | head -1)
mpath=$(ps aux | grep flac | grep -v grep | awk -F " -- " '{print $2}')
if [ -z "$mpath" ]
then
    mpath=$(ps aux | grep m4a | grep -v grep | awk -F " -- " '{print $2}')
fi
if [ -z "$mpath" ]
then
    mpath=$(ps aux | grep mp3 | grep -v grep | awk -F " -- " '{print $2}')
fi
csil="/tmp/cover.png"
csbil="$HOME/Scripts/popup/img/bg.png"
height="768"
ypos=$(expr "$height" - "242")

# extract the album art
ffmpeg -loglevel 0 -y -i "$mpath" -vf scale=-200:200 "$csil"

# display it
n30f -x 22 -y 490 -c "pkill n30f" "$csil"

# delete it
sleep ".25s"
rm "$csil"
