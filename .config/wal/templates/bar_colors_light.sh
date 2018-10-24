#!/usr/bin/env bash

source $HOME/.cache/wal/colors.sh

# colors
text="$foreground"
warning="#232e2f"
background="{color2}"

# other stuff
trs="%{{F#00000000}}"
bg="%{{B$background}}"
txt="%{{F{color0}}}"
wrn="%{{F$warning}}"

# accents
acc0="#b3bec1"
acc1="#f2f2f2"
acc2="#2a424a"

# background accents
a0="%{{B$acc0}}"
a1="%{{B{color0}}}"
a2="%{{B$acc2}}"

# foreground accents
af0="%{{F$acc0}}"
af1="%{{F$acc1}}"
af2="%{{F$acc2}}"

# misc
bgt="%{{B$text}}"
bgf="%{{F{color2}}}"
