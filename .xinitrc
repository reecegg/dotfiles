#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Load custom keymap.
if [ -f $HOME/.Xmodmap ]; then
  xmodmap $HOME/.Xmodmap
fi

# Load env.
if [ -f $HOME/.profile ]; then
  source $HOME/.profile
fi


# Esc binds
# Clear existing Caps Lock options
setxkbmap -option
# Remap Caps Lock to Escape
setxkbmap -option caps:escape
# Remap Escape to Caps Lock using xmodmap
xmodmap -e "keycode 9 = Caps_Lock"

# right alt to esc
xmodmap -e "keycode 108 = Escape"

# Start i3wm
#i3
