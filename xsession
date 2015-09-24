#!/bin/sh

# Load Resources
xrdb -merge .Xresources

#trayer --edge top --align right --SetDockType true \
#--expand true --width 10 --transparent true --tint 0x191970 --height 12 &

xsetroot -solid midnightblue

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

exec xmonad
exec xmobar
