from libqtile import hook

from settings import keys, mouse, groups, screens
from settings import layouts, floating_layout
from settings import widget_defaults, extension_defaults
from settings import qtile_path

import subprocess
from os import path


@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, "autostart.sh")])


cursor_warp = True
follow_mouse_focus = True
wnname = "LG3D"
