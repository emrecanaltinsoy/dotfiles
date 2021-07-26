#!/usr/bin/bash 
compton &
# # picom &
nitrogen --set-zoom-fill --random ~/wallpapers & # Wallpaper random set
# # nitrogen --restore &
# xfce4-power-manager & # Power Manager
dunst & # Notifications
# # Applets
# nm-applet & # Network Applet
blueman-tray & # Bluetooth Applet
# pnmixer & # Audio Applet
cbatticon -l 30 -r 10 -u 5 -x & # xfce4-power-manager-settings & # Battery Applet
# Start up Applications
mailspring &

# lxsession &
# festival --tts $HOME/.config/qtile/welcome_msg &
# volumeicon &
