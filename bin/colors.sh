#!/usr/bin/env bash

source $HOME/.cache/wal/colors.sh

# colors
text="$foreground"
warning="#232e2f"
background="$background"

# other stuff
trs="%{F#00000000}"
bg="%{B$background}"
txt="%{F$foreground}"
wrn="%{F$warning}"

# accents
acc0="#b3bec1"
acc1="#f2f2f2"
acc2="#273e45"
acc3="#133239"

# background accents
a0="%{B$acc0}"
a1="%{B$foreground}"
a2="%{B$acc2}"
a3="%{B$acc3}"

# foreground accents
af0="%{F$acc0}"
af1="%{F$acc1}"
af2="%{F$acc2}"

# misc
bgt="%{B$text}"
bgf="%{F$color0}"
