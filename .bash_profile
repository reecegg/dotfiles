#
# ~/.bash_profile
#

# Run .bashrc if it exists.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Startx if not already when running in a graphical environment.
#X=$( pidof Xorg )
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 && ${#X} -gt 0 ]]; then
#  exec startx
#fi
