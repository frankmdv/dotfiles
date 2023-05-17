#!/bin/sh

# Disk
# udiskie -t &

#Network
nm-applet &

# Bluetooth
blueman-applet &

# systray battery icon
# cbatticon -u 5 &

# systray volume
# volumeicon &

# Compositor
picom --no-vsync &

# Wallpaper
# feh --bg-scale ~/Images/wallpapers/detresNord_1920.jpg --bg-scale ~/Images/wallpapers/detresNord_1920.jpg --bg-fill ~/Images/wallpapers/detresNord_1680.jpg

# Sincronizar reloj
# timedatectl set-ntp 1

# Monitors configuration
if [ $(xrandr | grep -c " connected") -gt 1 ]; then
	setxkbmap -layout us -variant intl
	# feh --bg-scale ~/Images/wallpapers/detresNord_1920.jpg --bg-scale ~/Images/wallpapers/detresNord_1920.jpg --bg-fill ~/Images/wallpapers/detresNord_1680.jpg
else
	setxkbmap latam
fi
