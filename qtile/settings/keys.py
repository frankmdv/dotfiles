from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"

keys = [
    Key(*key)
    for key in [
        # ------------ Window Keys------------
        # Switch between windows in current stack pane
        ([mod], "j", lazy.layout.down()),
        ([mod], "k", lazy.layout.up()),
        ([mod], "h", lazy.layout.left()),
        ([mod], "l", lazy.layout.right()),
        # Change window sizes (supported for monadtall or monadwide layout)
        ([mod, "shift"], "h", lazy.layout.grow()),
        ([mod, "shift"], "l", lazy.layout.shrink()),
        # Toggle floating
        ([mod, "shift"], "f", lazy.window.toggle_floating()),
        # Move windows up or down in current stack
        ([mod, "shift"], "j", lazy.layout.shuffle_down()),
        ([mod, "shift"], "k", lazy.layout.shuffle_up()),
        # Toggle between different layouts as defined below
        ([mod], "Tab", lazy.next_layout()),
        ([mod, "shift"], "Tab", lazy.prev_layout()),
        # Kill window
        ([mod], "w", lazy.window.kill()),
        # Switch focus of monitors
        ([mod], "period", lazy.next_screen()),
        ([mod], "comma", lazy.prev_screen()),
        # Restart Qtile
        ([mod, "control"], "r", lazy.restart()),
        ([mod, "control"], "q", lazy.shutdown()),
        ([mod], "r", lazy.spawncmd()),
        # ------------ App Keys------------
        # Menu
        ([mod], "m", lazy.spawn("rofi -show drun")),
        # Window Nav
        ([mod, "shift"], "m", lazy.spawn("rofi -show")),
        # Browser
        ([mod], "b", lazy.spawn("firefox")),
        # File Explorer
        ([mod], "t", lazy.spawn("thunar")),
        # Terminal
        ([mod], "Return", lazy.spawn("kitty")),
        # Shutdown host
        ([mod, "shift"], "s", lazy.spawn("shutdown now")),
        # Reboot host
        ([mod, "shift"], "r", lazy.spawn("reboot")),
        # Screenshot
        ([mod], "Print", lazy.spawn("scrot")),
        ([mod, "shift"], "Print", lazy.spawn("scrot -s")),
        # ------------ Hardware Keys ------------
        # Volume
        (
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        ),
        (
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        ),
        ([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
        ([], "XF86AudioNext", lazy.spawn("playerctl next")),
        ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
        ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
        # Brightness
        ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
        ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    ]
]
