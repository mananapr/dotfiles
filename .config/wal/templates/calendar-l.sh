#!/usr/bin/env bash

source ~/.cache/wal/colors.sh

# vars
cil="/tmp/calendar.png"
bg="$HOME/Scripts/popup/img/bg.png"
width=$(xdotool "getdisplaygeometry" | awk '{{print $1;}}')
height=$(xdotool "getdisplaygeometry" | awk '{{print $2;}}')
ypos=$(expr "$height" - "298")
xpos=$(expr "$width")

# convert the output to png
convert -background "rgba(0,0,0,0)" \
		-fill "{color0}" \
		-font "Monaco" \
		-antialias \
		-pointsize 12 \
		label:"$(date "+%d %B %Y\n" && cal | tail -n7)" \
		"$cil"

# display it
$HOME/Scripts/popup/popup.sh "" "$(expr "$width" - "1356)" -p "16" &
sleep ".15s"
n30f -x "$(expr "$width" - "1323")" -y "$(expr "$ypos" + "-398")" -c "killall n30f" "$cil"

# delete it
sleep ".2s"
rm "$cil"
