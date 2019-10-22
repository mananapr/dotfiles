#!/usr/bin/env bash

source ~/.cache/wal/colors.sh

# vars
cil="/tmp/calendar.png"
bg="/home/manan/Scripts/popup/img/bg.png"
width=$(xdotool "getdisplaygeometry" | awk '{print $1;}')
height=$(xdotool "getdisplaygeometry" | awk '{print $2;}')
ypos=$(expr "$height" - "272")
xpos=$(expr "$width")

# convert the output to png
convert -background "rgba(255,255,255,0)" \
		-fill "#071d22" \
		-font "Monaco" \
		-antialias \
		-pointsize 10 \
		label:"$(date "+%d %B %Y\n" && cal | tail -n7)" \
		"$cil"

# display it
/home/manan/Scripts/popup/popup.sh "" "$(expr "$width" - "1358")" -p "20" &
sleep ".05s"
n30f -x "$(expr "$width" - "1307")" -y "$(expr "$ypos" + "-390")" -c "killall n30f" "$cil"

# delete it
sleep ".2s"
rm "$cil"
