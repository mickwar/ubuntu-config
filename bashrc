# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=1000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # PS1 is the prompt
#   PS1="\[\033[1;36m\]\h\[\033[0m\]: \[\033[1;34m\]\W\[\033[0m\]/ \[\033[1;36m\]\$\[\033[0m\] "
    PS1="(\[\033[1;36m\]\h\[\033[0m\]) \[\033[1;32m\]\u\[\033[0m\]: \[\033[1;34m\]\w\[\033[0m\]/ \[\033[1;32m\]\$\[\033[0m\] "

    # PS2 is for branching (if/else/for/while) in prompt
    PS2="\[\033[1;31m\]> \[\033[0m\]"
    # PS4 is when using the -x option (tracing) in a shell script
    # (there are some problems when adding the color)
    export PS4="-\[\033[1;31m\]+ \[\033[0m\]"
else
    PS1="\h: \W/ $ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# read: If file "~/.bash_aliases" exists, then read the "~/.bash_aliases" file.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

##############################################
### local edits (sick of having two files) ###
##############################################

# also run the commands in file .bashrc.local if it exists
# test -s ~/.bashrc.local && . ~/.bashrc.local || true

shopt -s extglob   # Enable extended globbing
set -o noclobber

# to edit /etc/sudoers, use: sudo -E visudo

# Set-up prompt
#PS1="\[\033[1;36m\]\h\[\033[0m\]: \[\033[1;34m\]\W\[\033[0m\]/ \[\033[1;36m\]\$\[\033[0m\] "

export EDITOR=vi
PATH="$HOME/bin:$PATH"
#export PATH=~/bin:$PATH
# the ~/bin before current PATH will make it so it runs the commands
# in ~/bin before those with the same name in other paths, hence my
# R command in ~/bin is always run when entering R in command line
# mw: line commented out since it can be found in ~/.profile

# running "source .bashrc" will cause update the bash. this is a
# a solution to closing and reopening a terminal when changes
# to .bashrc or .bashrc.local are made

# remove the first page of a pdf with the following command
# pdftk file.pdf cat 2-end output outfile.pdf

#PS1="\[\033[s\033[0;0H\033[0;41m\033[K\033[1;33m\t\033[0m\033[u\]\[\033[1;36m\]\h\[\033[0m\]: \[\033[1;34m\]\W\[\033[0m\]/ \[\033[1;36m\]\$\[\033[0m\] "
