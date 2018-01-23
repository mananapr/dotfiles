#!/usr/bin/env bash
# usage:
# popup [file] [placement] -p [pointer location]

# fetch the colors
source "/home/manan/Scripts/colors.sh"

# vars
background="/home/manan/Scripts/popup/img/bg.png"
pointer="/home/manan/Scripts/popup/img/pointer.png"
y="80"

# exec
n30f -x "$2" -y "$(expr $y + 6)" -c "killall n30f" "$background" &
sleep ".05s"
n30f -x "$(expr "$2" + 5)" -y "$(expr $y + 11)" -c "killall n30f" "$1" &

# pointer
if [ "$3" == "-p" ] ; then
	n30f -x "$(expr "$2" + "$4")" -y "$y" -c "killall n30f" "$pointer"
else
	exit
fi
