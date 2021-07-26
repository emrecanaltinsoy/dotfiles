#!/usr/bin/bash 
compton &
# picom &
nitrogen --set-zoom-fill --random ~/wallpapers & # Wallpaper random set
# nitrogen --restore &
# xfce4-power-manager & # Power Manager
dunst & # Notifications
# Applets
nm-applet & # Network Applet
blueman-tray & # Bluetooth Applet
volumeicon & # Audio Applet
# pnmixer & 
cbatticon -l 30 -r 10 -u 5 -x & # xfce4-power-manager-settings & # Battery Applet

# Start up Applications
mailspring &

# lxsession &
