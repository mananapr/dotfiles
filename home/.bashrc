#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|


# Source wal colors
source "$HOME/.cache/wal/colors.sh"

# Set vim as default editor
export EDITOR="vim"
# Set busybox less as pager
export PAGER="busybox less"
# For bluealsa
export LIBASOUND_THREAD_SAFE=0
# For fzf
 export 'FZF_DEFAULT_COMMAND'="find . -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

# Add Scripts folder to PATH
PATH="$PATH:$HOME/Scripts:$HOME/.local/bin"

# Enable Vim Mode in Bash
set -o vi
# Control+L for clear-screen
bind -m vi-insert "\C-l":clear-screen

# Aliases
alias 'v'='vim'
alias 'p'='python'
alias 'r'='ranger'
alias 'b'='xbacklight -set'
alias 'gs'='git status'
alias 'ga'='git add'
alias 'gm'='git commit -m'
alias 'gp'='git push'
alias 'add'='sudo apk add'
alias 'del'='sudo apk del'
alias 'fix'='sudo apk fix'
alias 'update'='sudo apk update'
alias 'upgrade'='sudo apk upgrade'
alias 'cleandbus'='sudo rm /var/run/dbus.pid'
alias 'mutespeaker'='amixer sset Speaker 0'
alias 'umutespeaker'='amixer sset Speaker 100'

# Shell Prompt
export PS1='\[\e[1m\]➜ \[\e[0m\] '

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
shopt -s autocd

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
