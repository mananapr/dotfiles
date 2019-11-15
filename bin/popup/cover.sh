#!/usr/bin/env bash

# quit on error
set -e

# vars
#csf=$(mpc -f %file% | head -1)
mpath=$(ps aux | grep flac | grep -v grep | grep SL | awk -F " -- " '{print $2}')
if [ -z $mpath ]
then
    mpath=$(ps aux | grep m4a | grep -v grep | grep SL | awk -F " -- " '{print $2}')
fi
if [ -z $mpath ]
then
    mpath=$(ps aux | grep mp3 | grep -v grep | grep SL | awk -F " -- " '{print $2}')
fi
csil="/tmp/cover.png"
csbil="$HOME/Scripts/popup/img/bg.png"
height=$(xdotool "getdisplaygeometry" | awk '{print $2;}')
ypos=$(expr "$height" - "242")

# extract the album art
ffmpeg -loglevel 0 -y -i "$mpath" -vf scale=-200:200 "$csil"

# display it
$HOME/Scripts/popup/popup.sh /tmp/cover.png "10" -p "28"

# delete it
sleep ".25s"
rm "$csil"
