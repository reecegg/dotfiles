# Run '\command' to run the command that it shadowed by an alias.

# Single letter aliases.
#alias a='TODO'
alias b='cd ..'
alias c='clear'
#alias d=''
#alias e='TODO'
alias f='fg'
alias g='git'
alias h='cd $HOME'
alias i='ipconfig getifaddr en0'
alias j='jobs'
#alias k='TODO'
alias l='ls -alF'
alias m='man'
#alias n='TODO'
#alias o='TODO'
alias p='ping -c 10'
#alias q='TODO'
alias r='sudo !!'
alias s='sudo'
alias t='tmux'
alias u='sudo -i'
alias v='vim'
#alias w='TODO'
alias x='exit'
#alias y='TODO'
#alias z='TODO'

# Safety Features.
alias cp='cp -i'	# Prompt for overwrite.
alias mv='mv -i'	# Prompt for overwrite.
alias rm='rm -I'	# Prompt for >3 or recursive deletion.
alias ln='ln -i'	# Promt for overwrite.
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Error Tolerance.
alias cd..='cd ..'


# Program Aliases

# cd Aliases.
alias ..='cd ..'
alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

# grep Aliases
alias grep='grep --color=auto'
alias fgrep='fregp --color=auto'
alias egrep='egrep --color=auto'
alias grephist='history | grep'	# Requires argument. Search history.
alias greppros='ps -Af | grep'  # Requires argument. Search process list.

# ls Aliases.
alias ls='ls -hF --color=auto'	# Follow symlink, dont sort.
alias la='ls -A'		# All.
alias lr='ls -R' 		# Recursive ls.
alias ll='ls -alF'
# Requires above alias.
alias lx='ll -BX'		# Sort by extension.
alias lz='ll -rS'		# Sort by size.
alias lt='ll -rt'		# Sort by date.

# Ping Aliases.
alias ping='ping -c 5'
