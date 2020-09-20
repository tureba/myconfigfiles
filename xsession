# Tureba's xsession/xinitrc settings
#
#  This file is run by the login manager after login
#  To use it, place it or a link to it in ~/.xsession and/or
#  ~/.xinitrc.
#  Roughly, ~/.xsession = ~/.profile + ~/.xinitrc
#
#  I'll need to customize it in each machine, so this is
#  mostly an example to remind me of the model to follow.
#
# who: Arthur Nascimento <tureba@gmail.com>
# where: github.com/tureba/myconfigfiles
#

# disable screen saver
xset s off

# disable bell
xset -b

# Enable zapping (C-A-<Bksp> kills X)
setxkbmap -option terminate:ctrl_alt_bksp
# Toggle keyboard layouts when pressing both shift keys
setxkbmap -option grp:shifts_toggle
# Use three keyboard layouts: us, us-intl (with deadkeys) and br-abnt2
setxkbmap us,us,br ,intl,abnt2

# LC_ALL would overide all others
unset LC_ALL

# if we have an external screen connected, set it on top of the notebook screen
xrandr --listactivemonitors | grep -q VGA-1 && xrandr --output VGA-1 --above LVDS-1

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec /usr/bin/i3
