#!/bin/sh

# Monitors configuration
if [ $(xrandr | grep -c " connected") -gt 1 ]; then
	setxkbmap -layout us -variant intl
	xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x601 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1366x445 --rate 74.97 --rotate normal --output DVI-I-1-1 --mode 1680x1050 --pos 3286x0 --rotate left
	feh --bg-scale ~/Images/wallpapers/detresNord_1920.jpg --bg-scale ~/Images/wallpapers/detresNord_1920.jpg --bg-fill ~/Images/wallpapers/detresNord_1680.jpg
else
	setxkbmap latam
	xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --output HDMI-1 --off --output DVI-I-1-1 --off
	feh --bg-scale ~/Images/wallpapers/detresNord_1920.jpg
fi
