#!/bin/sh
# simple powermenu with Rofi.
#
selected=$(printf "logout\nreboot\nshutdown\nsuspend" | rofi -dmenu)

case "$selected" in
    "logout") i3-msg exit;;
    "reboot") reboot;;
    "shutdown") poweroff;;
    "suspend") systemctl suspend;;
    *) exit 1;;
esac
