# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything.
case $- in
	*i*) ;;
	  *) return;;
esac


# Terminal History Settings.
# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Append to the history file instead of overwriting it.
shopt -s histappend
# Set max history lines/commands.
HISTSIZE=4000
# Set max history size.
HISTFILESIZE=8000

# Alias used for interacting with the dotfiles git repo.
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

# Update the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Setup the following as exec path.
export PAth="/HOME/$USER/bin:$PATH"
export PAth="/HOME/$USER/scripts:$PATH"

# Disable Ctrl-s and Ctrl-q sending "XOFF" and "XON" signals.
stty -ixon

# Run '.bash_aliases' if it exists.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
