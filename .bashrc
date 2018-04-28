# ~/.bashrc
# If not running interactively, don't do anything

source "$HOME/.cache/wal/colors.sh"
export EDITOR="vim"
PATH="$PATH:$HOME/Scripts"

#export WORKON_HOME=~/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh

# Shell Prompt
export PS1='\[\e[90m\]\w \[\e[31m\]>\[\e[0m\] '

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
