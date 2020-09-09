#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|


# Source wal colors
source "$HOME/.cache/wal/colors.sh"
cat /home/manan/.cache/wal/sequences

# Pass Bash Completion
source "$HOME/.local/bin/personal/pass.bash-completion"

# Enable E10s in Firefox
export MOZ_FORCE_DISABLE_E10S=0

# Default Programs
export EDITOR="vim"
export PAGER="less"
export TERMINAL="st"
export READER="zathura"

# Cleanup
export HISTFILE="$HOME/.local/share/bash/history"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$HOME/.local/share/gnupg"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$HOME/.config/java"
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# For fzf
export 'FZF_DEFAULT_COMMAND'="find . -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

# Add Scripts folder to PATH
PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/personal"

# Enable Vim Mode in Bash
set -o vi
# Control+L for clear-screen
bind -m vi-insert "\C-l":clear-screen

# Compile Flags 
export CFLAGS="-O3 -pipe -march=native"
export CXXFLAGS="-O3 -pipe -march=native"
export MAKEFLAGS="-j4"

# Aliases
alias 'vim'='vim -i NONE'
alias 'p'='python'
alias 'm'='mpv --no-audio-display -- "$(pwd)/"'
alias 'b'='light -S'
alias 'x'='xinit $HOME/.config/xinitrc -- /usr/bin/X :0 vt1 -keeptty'
alias 'pm'='pulsemixer'
alias 'gs'='git status'
alias 'ga'='git add'
alias 'gm'='git commit -m'
alias 'gp'='git push'
alias 'bat'='cat /sys/class/power_supply/BAT0/capacity /sys/class/power_supply/BAT0/status'
alias 'wpa_cli'='wpa_cli -iwlp3s0'
alias 'tmux'='tmux -f ~/.config/tmux/tmux.conf'
alias 'svn'='svn --config-dir ~/.config/subversion'
alias 'irssi'='irssi --config ~/.config/irssi/config --home ~/.local/share/irssi'
alias 'lswifi'="wpa_cli scan; sleep 5; wpa_cli scan_results;"
alias 'megals'='megals --config ~/.config/megarc'
alias 'megadf'='megadf --config ~/.config/megarc'
alias 'megadl'='megadl --config ~/.config/megarc'
alias 'megaput'='megaput --config ~/.config/megarc'
alias 'megaget'='megaget --config ~/.config/megarc'
alias 'megacopy'='megacopy --config ~/.config/megarc'
alias 'megarm'='megarm --config ~/.config/megarc'

# Shell Prompt
export PS1='\[\e[1m\]->\[\e[0m\] '

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Add to history instead of overriding it
shopt -s histappend

# History lenght
HISTSIZE=1000
HISTFILESIZE=2000

# Window size sanity check
shopt -s checkwinsize

# Auto cd
#shopt -s autocd

# ls after a cd
function cd()
{
 builtin cd "$*" && ls
}

# Color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Color man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

extract () {
    if [ -f "$1" ] ; then
      case "$1" in
        *.tar.bz2|*.tbz2)   tar xjf "$1"     ;;
        *.tgz|*.tar.gz)     tar xzf "$1"     ;;
        *.bz2)              bunzip2 "$1"     ;;
        *.7z|.rar)          7z x "$1"        ;;
        *.gz)               gunzip "$1"      ;;
        *.tar)              tar xf "$1"      ;;
        *.zip)              unzip "$1"       ;;
        *.Z)                uncompress "$1"  ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# lf config
f () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
export OPENER=opn
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
