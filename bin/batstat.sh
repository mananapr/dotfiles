#!/usr/bin/env bash
# Gives Battery Status

which notify-send &> /dev/null

if [ $? = 0 ] ; then
	notify-send "$(acpi -b | sed 's/Battery 0: //')"
else
	printf "error: notify-send not found\n"
	exit 1
fi
