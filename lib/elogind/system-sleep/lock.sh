#!/bin/sh
#
# /lib/elogind/system-sleep/lock.sh
# Lock before suspend integration with elogind

username=manan
userhome=/home/$username
#export DISPLAY=":0.0"
export WAYLAND_DISPLAY="wayland-1"
export XDG_RUNTIME_DIR=/run/user/1000

case "${1}" in
        pre)
            su $username -c "/home/manan/.local/bin/personal/lock" &
	    sleep 1s;
            ;;
esac
