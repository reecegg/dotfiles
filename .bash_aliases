# Run '\command' to run the command that it shadowed by an alias.

# ==============================================================================
# Default Replacements
# ==============================================================================
alias ls='lsd'

# ==============================================================================
# Single letter aliases.
# ==============================================================================
#alias a='TODO'
alias b='cd ..'
alias c='clear'
#alias d=''
alias e='sudoedit'
alias f='fg'
alias g='git'
alias h='cd $HOME'
alias i='ipconfig getifaddr en0'
alias j='jobs'
#alias k='TODO'
alias l='ls -alF'
alias m='man'
#alias n='TODO'
alias o='_o'
#alias o="function _o() { eval nodup xdg-open $@ & disown; }"
function _o() { eval nohup xdg-open $@ >/dev/null 2>&1 & disown; }
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

# ==============================================================================
# Safety Features.
# ==============================================================================
alias cp='cp -i'	# Prompt for overwrite.
alias mv='mv -i'	# Prompt for overwrite.
alias rm='rm -I'	# Prompt for >3 or recursive deletion.
alias ln='ln -i'	# Promt for overwrite.
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# ==============================================================================
# Error Tolerance.
# ==============================================================================
alias cd..='cd ..'

# ==============================================================================
# Misc Aliases
# ==============================================================================
alias also="function _also() { eval nohup "$@" & disown; }"
alias src="source ~/.bashrc"
alias uuid="cat /proc/sys/kernel/random/uuid"
alias hs="history -r"
alias hst="history -r"
alias fix="reset && stty sane && tput rs1"
alias lh="grep -P \"^Host ([^*]+)$\" $HOME/.ssh/config | sed 's/Host //'"

# ==============================================================================
# Program Aliases
# ==============================================================================

# ------------------------------------------------------------------------------
# cd Aliases.
alias ..='cd ..'
alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

alias cdg='cd ~/git/'
alias cdf='cd ~/file/'
alias cds='cd ~/scratch/'
alias cdsql='cd ~/sql-dump/'
alias cdb='cd ~/bin/'
alias cdssh='cd ~/.ssh/'
alias cdt='cd ~/tmp/'
alias cdc='cd ~/.config/'
alias cdd='cd ~/Downloads/'
alias cdbak='cd ~/bak/'

# ------------------------------------------------------------------------------
# grep Aliases
alias grep='grep --color=auto'
alias fgrep='fregp --color=auto'
alias egrep='egrep --color=auto'
alias grephist='history | grep'	# Requires argument. Search history.
alias greppros='ps -Af | grep'  # Requires argument. Search process list.

# ------------------------------------------------------------------------------
# ls default Aliases.
alias ls='ls -hF --color=auto'	# Follow symlink, dont sort.
alias la='ls -A'		# All.
alias lr='ls -R' 		# Recursive ls.
alias ll='ls -alF'
# Requires above alias.
alias lx='ll -BX'		# Sort by extension.
alias lz='ll -rS'		# Sort by size.
alias lt='ll -rt'		# Sort by date.
# ls to lsd conditional aliases.
if command -v lsd &> /dev/null
then
	alias ls='lsd -hF --color=auto'	# Follow symlink, dont sort.
	alias la='lsd -A'		# All.
	alias lr='lsd -R' 		# Recursive ls.
	alias ll='lsd -alF'
	# Requires above alias.
	alias lx='ll -BX'		# Sort by extension.
	alias lz='ll -rS'		# Sort by size.
	alias lt='ll -rt'		# Sort by date.
fi

# ------------------------------------------------------------------------------
# Ping Aliases.
alias ping='ping -c 5'

# ------------------------------------------------------------------------------
# Composer Aliases.
alias composer1="php ~/bin/composer1.phar"
alias composerone="php ~/bin/composer1.phar"
alias ci="composer install"
alias cmi="php -d memory_limit=-1 ~/bin/composer1.phar install"
alias cmu="php -d memory_limit=-1 ~/bin/composer1.phar update"
alias cmr="php -d memory_limit=-1 ~/bin/composer1.phar require"

# Composer 2 Aliases.
alias c2mi="php -d memory_limit=-1 ~/bin/composer.phar install"
alias c2mu="php -d memory_limit=-1 ~/bin/composer.phar update"
alias c2mr="php -d memory_limit=-1 ~/bin/composer.phar require"

# ------------------------------------------------------------------------------
# Ngrok Aliases.
alias ngr="ngrok http localhost:8000"

# ------------------------------------------------------------------------------
# NPM Aliases.
alias npmi="npm install"
alias npmrw="npm run watch"

# ------------------------------------------------------------------------------
# PHP Artisan Aliases.
alias pac="php artisan cache:clear; php artisan route:clear; php artisan view:clear; php artisan config:clear"
alias pacs="pac; php artisan serve"
alias pacac="php artisan cache:clear"
alias pacc="php artisan config:clear"
alias pakg="php artisan key:generate"
alias pam="php artisan migrate"
alias pamf="php artisan migrate:fresh"
alias pamfs="php artisan migrate:fresh --seed"
alias pamr="php artisan migrate:rollback"
alias paq="php artisan queue:listen"
alias paqq="function _paqq() { eval php aritsan queue:listen --queue=$1; }"
alias paqw="php artisan queue:work"
alias parc="php artisan route clear"
alias parl="php artisan route:list"
alias pas="php artisan serve"
alias pat="php artisan tinker"
alias padbs="php artisan db:seed"
alias tinker="php artisan tinker"
alias sch="watch -n 60 php artisan schedule:run"
alias sch5="watch -n 5 php artisan schedule:run"
alias sch15="watch -n 15 php artisan schedule:run"
alias sch30="watch -n 30 php artisan schedule:run"

# ------------------------------------------------------------------------------
# Tmux Aliases.

alias ta="t attach"




# ==============================================================================
# Run '.bash_aliases_local' if it exists.
# ==============================================================================
if [ -f ~/.bash_aliases_local ]; then
	. ~/.bash_aliases_local
fi
