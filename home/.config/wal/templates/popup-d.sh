#!/usr/bin/env bash
# usage:
# popup [file] [placement] -p [pointer location]

# fetch the colors
source "$HOME/.local/bin/personal/colors.sh"


# vars
background="$HOME/.local/bin/personal/popup/img/bg2.png"
pointer_main="$HOME/.local/bin/personal/popup/img/pointer.png"
pointer="$HOME/.local/bin/personal/popup/img/pointer_mod.png"
y="42"

# make bg.png from pywal color0
convert -size 200x200 xc:"#ffffff" "$background"
convert -border 13x13 -bordercolor "#ffffff" "$background" "$background"
# replace the color in pointer.png to pywal color7
convert "$pointer_main" -fuzz 50% -fill "#ffffff" -opaque "#f2f2f2" "$pointer"

# exec
n30f -x "$2" -y "$(expr $y + 6)" -c "killall n30f" "$background" &
sleep ".05s"
n30f -x "$(expr "$2" + 13)" -y "$(expr $y + 19)" -c "killall n30f" "$1" &

rm "$background"

# pointer
if [ "$3" == "-p" ] ; then
	n30f -x "$(expr "$2" + "$4")" -y "$y" -c "killall n30f" "$pointer"
    rm "$pointer"
else
	exit
fi
