#!/bin/sh
#
# /lib/elogind/system-sleep/lock.sh
# Lock before suspend integration with elogind

username=manan
userhome=/home/$username
export DISPLAY=":0.0"

case "${1}" in
        pre)
            su $username -c "/usr/bin/slock" &
            sleep 1s;
            ;;
esac
