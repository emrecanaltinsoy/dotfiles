#!/usr/bin/bash 
compton & # Compositor
# picom & # Compositor
nitrogen --set-zoom-fill --random ~/wallpapers & # Wallpaper random set
# nitrogen --restore & # Restore the previous wallpaper
dunst & # Notifications
#------------------------------------------------------------------------------#
#                                    Applets                                   #
#------------------------------------------------------------------------------#
nm-applet & # Network Applet
blueman-tray & # Bluetooth Applet
volumeicon & # Audio Applet
cbatticon -l 30 -r 10 -u 5 & # Battery Applet
#------------------------------------------------------------------------------#
#                             Start up Applications                            #
#------------------------------------------------------------------------------#
mailspring & # E-mail client
# lxsession &
