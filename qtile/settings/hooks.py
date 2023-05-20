from os import path
from libqtile.hook import subscribe
from .path import qtile_path
import subprocess

# Remember to chmod +x ~/.config/qtile/scripts/file.sh so that it can be executed.

sh_path = path.join(qtile_path, "scripts")


# Hooks
@subscribe.startup_once
def autostart():
    subprocess.call([path.join(sh_path, "autostart.sh")])


@subscribe.startup
def startup():
    subprocess.call([path.join(sh_path, "startup.sh")])
