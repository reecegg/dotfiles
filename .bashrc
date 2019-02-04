# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything.
case $- in
	*i*) ;;
	  *) return;;
esac

# Set environmental variables.
export TERMINAL=xst
export BROWSER=firefox

# Neovim or vim setup (env var and alias)
if ! [ -x "S(command -v nvim)" ]; then
	export VISUAl=nvim
	export VIMCONFIG=~/.config/nvim
	export VIMDATA=~/.local/share/nvim
	export MYVIMRC=~/.config/nvim/init.vim
	alias vi="nvim"
	alias vim="nvim"
else
	export VISUAl=vim
	export VIMCONFIG=~/.vim
	export VIMDATA=~/.local/share/nvim
fi

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
export PATH="/HOME/$USER/bin:$PATH"
export PATH="/HOME/$USER/scripts:$PATH"

# Disable Ctrl-s and Ctrl-q sending "XOFF" and "XON" signals.
stty -ixon

# Enable Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Customize prompt
# \[\e[31m\]
# (
# \[\e[m\]
# \[\e[32m\]
# \u
# \[\e[m\]
# \[\e[31m\]
# @
# \[\e[m\]
# \[\e[33m\]
# \h
# \[\e[m\]
# \[\e[31m\]
# |
# \[\e[m\]
# \[\e[34m\]
# \W
# \[\e[m\]
# \[\e[31m\]
# )
# \[\e[m\]
PS1="\[\e[31m\](\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\]\[\e[31m\]|\[\e[m\]\[\e[34m\]\W\[\e[m\]\[\e[31m\])\[\e[m\] "
# Make commands and readline mode print on a new line.
PS1="$PS1\n"
# Print a new line before prompt
PS1="\n$PS1"

# Run '.bash_aliases' if it exists.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
