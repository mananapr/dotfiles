#!/usr/bin/env bash

source ~/.cache/wal/colors.sh

# vars
cil="/tmp/calendar.png"
bg="$HOME/.local/bin/personal/popup/img/bg.png"
background="$HOME/.local/bin/personal/popup/img/bg2.png"
width=$(xdotool "getdisplaygeometry" | awk '{print $1;}')
height=$(xdotool "getdisplaygeometry" | awk '{print $2;}')
ypos=$(expr "$height" - "272")
xpos=$(expr "$width")

# convert the output to png
convert -background "rgba(33,33,33,0)" \
		-fill "$foreground" \
		-font "Monaco" \
		-antialias \
		-pointsize 10 \
		label:"$(date "+%d %B %Y\n" && cal | tail -n7)" \
		"$cil"

convert -size 200x200 xc:"$color0" "$background"

# display it
n30f -x 22 -y 490 -c "killall n30f" "$background" &
sleep ".05s"
n30f -x 62 -y 540 -c "killall n30f" "$cil" &

# delete it
sleep ".2s"
rm "$cil"
