# ~/.bashrc: executed by bash(1) for non-login shells.

# Java AWT fix for GUI applications (IntelliJ) in some window managers (i3).
export _JAVA_AWT_WM_STATIC_GRAVITY=1

# If not running interactively, don't do anything.
case $- in
	*i*) ;;
	  *) return;;
esac

# Neovim or vim setup (env var and alias)
export VISUAL=nvim
export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export MYVIMRC=~/.config/nvim/init.vim
alias vi="nvim"
alias vim="nvim"

if [ -n "$TMUX" ]; then
    export TERM=tmux-256color
else
    export TERM=xterm-256color
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
# User
export PATH="/home/$USER/bin:$PATH"
export PATH="/home/$USER/.local/bin:$PATH"
export PATH="/home/$USER/scripts:$PATH"
# PHP: Composer
export PATH="/home/$USER/.config/composer/vendor/bin:$PATH"
# Go: GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Disable Ctrl-s and Ctrl-q sending "XOFF" and "XON" signals.
stty -ixon


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

# Boostrap nvm
NVM=/usr/share/nvm/init-nvm.sh
if [ -e $NVM ]; then
	source /usr/share/nvm/init-nvm.sh
fi

# Boostrap rbenv
eval "$(rbenv init -)"

# Boostrap rust
. "$HOME/.cargo/env"

# Load API keys
if [ -f ~/.secrets/api_keys.sh ]; then
    source ~/.secrets/api_keys.sh
fi
