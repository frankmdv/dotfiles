from libqtile import widget as wg
from .theme import colors


def workspaces(
    highlight_method="text",
    fontsize=20,
    active=colors["active"],
    inactive=colors["inactive"],
    this_current_screen_border=colors["focus"],
    urgent_alert_method="text",
    urgent_text=colors["urgent"],
    **kwargs
):
    return wg.GroupBox(
        highlight_method=highlight_method,
        fontsize=fontsize,
        active=active,
        inactive=inactive,
        this_current_screen_border=this_current_screen_border,
        urgent_alert_method=urgent_alert_method,
        urgent_text=urgent_text,
        **kwargs
    )


# Disused widgets:

# def window_name(max_chars=20, **kwargs):
#     return wg.WindowName(max_chars=max_chars, **kwargs)

# def layout_icon(scale=0.6, padding=1):
#     return wg.CurrentLayoutIcon(scale=scale, padding=padding)


def clock(format="%I:%M %p"):
    return wg.Clock(format=format)


def icon(graphic="?", foreground=colors["text"], **kwargs):
    return wg.TextBox(text=graphic, foreground=foreground, **kwargs)


def check_updates(
    colour_have_updates=colors["text"],
    colour_no_updates=colors["text"],
    no_update_string="0",
    display_format="{updates}",
    update_interval=1800,
    custom_command="checkupdates",
    **kwargs
):
    return wg.CheckUpdates(
        colour_have_updates=colour_have_updates,
        colour_no_updates=colour_no_updates,
        no_update_string=no_update_string,
        display_format=display_format,
        update_interval=update_interval,
        custom_command=custom_command,
        **kwargs
    )


def cpu(format="{load_percent}%", **kwargs):
    return wg.CPU(format=format, **kwargs)


def window_count(show_zero=True):
    return wg.WindowCount(show_zero=show_zero)


def systray(background=colors["systray"]):
    return wg.Systray(background=background)


widget_defaults = {
    "font": "JetBrains Mono Bold",
    "fontsize": 14,
    "foreground": colors["text"],
}

extension_defaults = widget_defaults.copy()
