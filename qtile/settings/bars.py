from libqtile import bar, widget as wg
from . import widgets as custom_wg
from .theme import colors


def status_bar(widgets, size=30, background=colors["dark"]):
    return bar.Bar(widgets, size=size, background=background)


def main_bar():
    return status_bar(
        [
            wg.Spacer(10),
            custom_wg.workspaces(),
            wg.Spacer(15),
            wg.CurrentLayout(),
            wg.Spacer(bar.STRETCH),
            custom_wg.clock(),
            wg.Spacer(bar.STRETCH),
            custom_wg.icon(graphic=" "),  # nf-fa-upload
            custom_wg.check_updates(),
            wg.Spacer(10),
            custom_wg.icon(graphic=" "),
            custom_wg.cpu(),
            wg.Spacer(10),
            custom_wg.icon(graphic=" "),  # nf-cod-window
            custom_wg.window_count(),
            wg.Spacer(10),
            custom_wg.systray(),
        ],
    )


def secondary_bar():
    return status_bar(
        [
            wg.Spacer(10),
            custom_wg.workspaces(),
            wg.Spacer(15),
            wg.CurrentLayout(),
            wg.Spacer(bar.STRETCH),
            custom_wg.clock(),
            wg.Spacer(bar.STRETCH),
            custom_wg.icon(graphic=" "),  # nf-fa-upload
            custom_wg.window_count(),
            wg.Spacer(10),
        ],
    )
