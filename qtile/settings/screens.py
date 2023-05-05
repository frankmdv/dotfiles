import os
from libqtile.config import Screen
from libqtile import bar
from libqtile.log_utils import logger
from .widgets import primary_widgets, secondary_widgets
import subprocess


def status_bar(widgets):
    return bar.Bar(widgets, 24, opacity=0.92)


screens = [Screen(top=status_bar(primary_widgets()))]

xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"

command = subprocess.run(
    xrandr,
    shell=True,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
)

keyboard_layout = "setxkbmap latam"

if command.returncode != 0:
    error = command.stderr.decode("UTF-8")
    logger.error(f"Failed counting monitors using {xrandr}:\n{error}")
    connected_monitors = 1
else:
    connected_monitors = int(command.stdout.decode("UTF-8"))

if connected_monitors > 1:
    os.system(
        "xrandr --output eDP-1 --primary --mode 1366x768 --pos \
              0x456 --rotate normal --output HDMI-1 --mode 1920x1080 \
              --pos 1366x300 --rotate normal --output DVI-I-1-1 --mode \
              1680x1050 --pos 3286x0 --rotate left"
    )

    keyboard_layout = "setxkbmap -layout us -variant intl"
    for _ in range(1, connected_monitors):
        screens.append(Screen(top=status_bar(secondary_widgets())))

os.system(keyboard_layout)
