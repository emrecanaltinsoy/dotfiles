# Layouts and layout rules

from libqtile import layout
from libqtile.config import Match

layout_theme = {
    "border_width": 2,
    "margin": 12,
    "border_focus": "e1acff",
    "border_normal": "1D2330",
}

layouts = [
    # layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(shift_windows=True, **layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    # layout.Stack(num_stacks=2, **layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Floating(**layout_theme),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(title="Confirmation"),  # tastyworks exit box
        Match(title="Calculator"),  # tastyworks exit box
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="Bluetooth Devices"),  # GPG key password entry
        Match(title="Network Connections"),  # GPG key password entry
        Match(title="Volume Control"),  # GPG key password entry
    ]
)
