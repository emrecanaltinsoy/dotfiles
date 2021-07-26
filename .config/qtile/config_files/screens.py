# Screens

from libqtile import bar, widget
from libqtile.config import Screen
from .general import BAR_OPACITY, BAR_SIZE, HOME_DIR, FONT_NERD
from .widgets import *
from .colors import colors

main_widgets = [
    # Icon
    *python_icon(f_color=colors["group-names-font"],
                 b_color=colors["panel-background"],
                 file_dir=f"{HOME_DIR}/.config/qtile/layout-icons/python-white.png",
                 scale=0.7),
    # Workspaces
    *workspaces(),
    # Layout
    *layout(f_color=colors["group-names-font"], b_color=colors["odd-widget"],
            scale=0.7, file_dir=[f"{HOME_DIR}/.config/qtile/layout-icons"]),
    # Window count
    *window_count(f_color=colors["group-names-font"],
                  b_color=colors["even-widget"], font=FONT_NERD, font_size=14),
    # Current window name
    *window_name(f_color=colors["window-name"],
                 b_color=colors["panel-background"]),
    # Network
    *network(f_color=colors["group-names-font"],
             b_color=colors["odd-widget"], font_size=12),
    # Check updates
    *check_updates(font=FONT_NERD, f_color=colors["group-names-font"],
                   b_color=colors["even-widget"], font_size=12),
    # Memory CPU Usage
    *memory_cpu(font=FONT_NERD, f_color=colors["group-names-font"],
                b_color=colors["odd-widget"], font_size=12),
    # Date-Time
    *date_time(f_color=colors["group-names-font"],
               b_color=colors["even-widget"]),
    # Brightness
    *brightness(f_color=colors["group-names-font"], font=FONT_NERD,
                b_color=colors["odd-widget"], font_size=12),
    # System tray
    *systemtray(f_color=colors["group-names-font"],
                b_color=colors["odd-widget"]),
    # Power button
    *power_menu(f_color=colors["group-names-font"], font=FONT_NERD,
                b_color=colors["odd-widget"], font_size=14),
]

screens = [Screen(top=bar.Bar(main_widgets, BAR_SIZE, opacity=BAR_OPACITY))]
