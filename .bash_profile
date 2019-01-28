#
# ~/.bash_profile
#

# Run .bashrc if it exists.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Startx if running in a graphical environment.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
