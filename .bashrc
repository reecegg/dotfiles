# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything.
case $- in
	*i*) ;;
	  *) return;;
esac

# Environemnt setup
export TERMINAL=xst
export DATAGRIP_JDK=/usr/lib/jvm/default
export JDK_HOME=/usr/lib/jvm/default
export JAVA_HOME=/usr/lib/jvm/default

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

# Setup FZF
export FZF_DEFAULT_COMMAND='rg --files --ignore-case --color auto --hidden --follow --glob "!.git/*"'

# Terminal History Settings.
# Don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
# Set max history lines/commands.
HISTSIZE=1000000
# Set max history size.
HISTFILESIZE=1000000

# Alias used for interacting with the dotfiles git repo.
alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias configlg='lazygit --git-dir=$HOME/.cfg --work-tree=$HOME'

# Update the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend

# Setup the following as exec path.
export PATH="/home/$USER/bin:$PATH"
export PATH="/home/$USER/.local/bin:$PATH"
export PATH="/home/$USER/scripts:$PATH"
export PATH="/home/$USER/.config/composer/vendor/bin:$PATH"

# Disable Ctrl-s and Ctrl-q sending "XOFF" and "XON" signals.
stty -ixon

# Source node version manager init script if readable.
NVM=/usr/share/nvm/init-nvm.sh
if [ -e $NVM ]; then
	source /usr/share/nvm/init-nvm.sh
fi

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
# \$(dirs +0)
# \[\e[m\]
# \[\e[31m\]
# )
# \[\e[m\]
PS1="\[\e[31m\](\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\]\[\e[31m\]|\[\e[m\]\[\e[34m\]\$(dirs +0)\[\e[m\]\[\e[31m\])\[\e[m\] "
# Make commands and readline mode print on a new line.
PS1="$PS1\n"

# Run '.bash_aliases' if it exists.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Run '.bash_completion' if it exists.
if [ -f ~/.bash_completion ]; then
	. ~/.bash_completion
fi

# rbenv init
eval "$(rbenv init -)"

# Added by rustup
. "$HOME/.cargo/env"
