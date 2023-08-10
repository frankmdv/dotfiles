#!/bin/sh

# Disk
udiskie -t &

#Network
nm-applet &

# Bluetooth
blueman-applet &

# systray battery icon
cbatticon &

# systray volume
# volumeicon &

# Compositor
picom &

# Sincronizar reloj
# timedatectl set-ntp 1
