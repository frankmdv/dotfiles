from libqtile.config import Match
from libqtile import layout
from .theme import colors

# Layouts and layout rules

layout_conf = {
    "border_focus": colors["focus"],
    "border_width": 1,
    "margin": 4,
}

layouts = [
    layout.Max(),
    layout.Bsp(border_on_single=True, **layout_conf),
    *[
        ly(**layout_conf)
        for ly in [
            layout.MonadTall,
            layout.MonadWide,
            layout.Matrix,
            layout.RatioTile,
        ]
    ],
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ],
    border_focus=colors["focus"],
)
