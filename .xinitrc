#!/bin/sh
#   ________
#  /_  __/ /_  __  _________  ______ ___
#   / / / __ \/ / / / ___/ / / / __ `__ \
#  / / / / / / /_/ / /  / /_/ / / / / / /
# /_/ /_/ /_/\__, /_/   \__,_/_/ /_/ /_/
#           /____/
#
# Filename:   .xinitrc
# Github:     https://github.com/Thyrum/dotfiles
# Maintainer: Thyrum (Aron de Jong)

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# switch caps and escape
setxkbmap -option caps:swapescape

exec bspwm
