from os import path
from libqtile import hook
from .path import qtile_path

import subprocess


@hook.subscribe.startup_once
def autostart():
    # Remember to chmod +x ~/.config/qtile/autostart.sh so that it can be executed.
    subprocess.call([path.join(qtile_path, "autostart.sh")])
