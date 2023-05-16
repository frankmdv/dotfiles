from libqtile.config import Group, Key
from libqtile.command import lazy
from .keys import mod, keys


# Qtile groups
# Icon: , Name: nf-cod-debug_breakpoint_data
groups = [
    Group(name=str(num), label=icon) for num, icon in [(n, "") for n in range(1, 7)]
]

# Group keys
for group in groups:
    keys.extend(
        [
            # Switch to workspace N
            Key([mod], group.name, lazy.group[group.name].toscreen()),
            # Send window to workspace N
            Key([mod, "shift"], group.name, lazy.window.togroup(group.name)),
        ]
    )
