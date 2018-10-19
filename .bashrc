#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|


# Source wal colors
source "$HOME/.cache/wal/colors.sh"

# Set vim as default editor
export EDITOR="vim"

# Add Scripts folder to PATH
PATH="$PATH:$HOME/Scripts"

# Enable Vim Mode in Bash
set -o vi
# Control+L for clear-screen
bind -m vi-insert "\C-l":clear-screen

## Python Virtual Environment Wrapper
#export WORKON_HOME=~/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh

# Wifi Hotspot
alias 'hotspot'="sudo create_ap wlp3s0 wlp3s0 'ssid' pwd"

# Aliases
alias 'p'='python'
alias 'r'='ranger'
alias 'pm'='pacman'
alias 'pmu'='sudo pacman -Syu'
alias 'pmi'='sudo pacman -S'
alias 'pms'='pacman -Ss'

# Shell Prompt
export PS1='\[\e[90m\]\w \[\e[31m\]>\[\e[0m\] '

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
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       7z x $1        ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
