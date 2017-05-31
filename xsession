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
# preferred language
export LANG=pt_BR.UTF-8
export LANGUAGE=pt_BR.UTF-8
# system messages shouldn't be translated
export LC_MESSAGES=C
# prefer YYYY-MM-DD HH:mm (ISO 8601)
export LC_TIME=en_DK.UTF-8

exec /usr/bin/i3
