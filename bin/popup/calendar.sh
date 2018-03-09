#!/usr/bin/env bash

source ~/.cache/wal/colors.sh

# vars
cil="/tmp/calendar.png"
bg="/home/manan/Scripts/popup/img/bg.png"
width=$(xdotool "getdisplaygeometry" | awk '{print $1;}')
height=$(xdotool "getdisplaygeometry" | awk '{print $2;}')
ypos=$(expr "$height" - "242")
xpos=$(expr "$width")

# convert the output to png
convert -background "rgba(0,0,0,0)" \
		-fill "$color3" \
		-font "Monaco" \
		-antialias \
		-pointsize 12 \
		label:"$(date "+%d %B %Y\n" && cal | tail -n7)" \
		"$cil"

# display it
/home/manan/Scripts/popup/popup.sh "" "$(expr "$width" - "1340")" -p "70" &
sleep ".05s"
n30f -x "$(expr "$width" - "1310")" -y "$(expr "$ypos" + "-400")" -c "killall n30f" "$cil"

# delete it
sleep ".2s"
rm "$cil"
