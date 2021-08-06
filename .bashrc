export HISTTIMEFORMAT="%Y-%m-%d %T "
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# Change the prompt
export PS1="[\e[96m\d, \@\e[39m]\e[33m\$(parse_git_branch)\e[92m\e[39m\u@\e[94m\h\e[39m:\W\n> "

# Add aliases file
if [ -f ~/.bash_aliases ]; then
        source ~/.bash_aliases
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
set -o vi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
#PS1='\u@\h:\W[\t]\\$ '
#PS1="[\T]\u@\h:\[$(tput bold)\]\W\[$(tput sgr0)\]\\$\[$(tput sgr0)\]"
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1)/'
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

export TERM=xterm-256color

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Add stuff to the path
export PATH=/usr/local/bin:$PATH # make sure /usr/local/bin is searched before /usr/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/rdiesel007/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/rdiesel007/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/rdiesel007/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/rdiesel007/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
