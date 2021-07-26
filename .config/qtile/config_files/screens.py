# Screens

from libqtile import bar
from libqtile.config import Screen
from .general import BAR_OPACITY, BAR_SIZE, HOME_DIR, FONT_NERD
from .widgets import *
from .colors import colors

main_widgets = [
    # Icon
    *python_icon(b_color=colors["panel-background"],
                 file_dir=f"{HOME_DIR}/.config/qtile/layout-icons/python-white.png",
                 scale=0.7),
    # Workspaces
    *workspaces(workspace_colorscheme=colors["workspace_colors"], font=FONT_NERD, font_size=16),

    # Powerline Left
    *powerline_left(f_color=colors["workspace_colors"]["background"], font=FONT_NERD,
                    b_color=colors["widget1_back"], font_size=36),

    # Layout
    *layout(f_color=colors["widget1_fore"], b_color=colors["widget1_back"],
            scale=0.7, file_dir=[f"{HOME_DIR}/.config/qtile/layout-icons"]),

    # Powerline Left
    *powerline_left(f_color=colors["widget1_back"], font=FONT_NERD,
                    b_color=colors["widget2_back"], font_size=36),

    # Window count
    *window_count(f_color=colors["widget2_fore"],
                  b_color=colors["widget2_back"], font=FONT_NERD, font_size=14),

    # Powerline Left
    *powerline_left(f_color=colors["widget2_back"], font=FONT_NERD,
                    b_color=colors["panel-background"], font_size=36),

    # Current window name
    *window_name(f_color=colors["window-name"],
                 b_color=colors["panel-background"]),

    # Powerline Right
    *powerline_right(f_color=colors["widget3_back"], font=FONT_NERD,
                     b_color=colors["panel-background"], font_size=36),

    # Network
    *network(f_color=colors["widget3_fore"],
             b_color=colors["widget3_back"], font_size=12),

    # Powerline Right
    *powerline_right(f_color=colors["widget4_back"], font=FONT_NERD,
                     b_color=colors["widget3_back"], font_size=36),

    # Check updates
    *check_updates(font=FONT_NERD, f_color=colors["widget4_fore"],
                   b_color=colors["widget4_back"], font_size=12),

    # Powerline Right
    *powerline_right(f_color=colors["widget1_back"], font=FONT_NERD,
                     b_color=colors["widget4_back"], font_size=36),

    # Memory CPU Usage
    *memory_cpu(font=FONT_NERD, f_color=colors["widget1_fore"],
                b_color=colors["widget1_back"], font_size=12),

    # Powerline Right
    *powerline_right(f_color=colors["widget2_back"], font=FONT_NERD,
                     b_color=colors["widget1_back"], font_size=36),

    # Date-Time
    *date_time(f_color=colors["widget2_fore"],
               b_color=colors["widget2_back"]),

    # Powerline Right
    *powerline_right(f_color=colors["panel-background"], font=FONT_NERD,
                     b_color=colors["widget2_back"], font_size=36),
    # System tray
    * systemtray(f_color=colors["widget4_fore"],
                 b_color=colors["panel-background"]),
    # Brightness
    *brightness(f_color=colors["window-name"], font=FONT_NERD,
                b_color=colors["panel-background"], font_size=12),
    # Power button
    *power_menu(f_color=colors["window-name"], font=FONT_NERD,
                b_color=colors["panel-background"], font_size=14),
]

screens = [Screen(top=bar.Bar(main_widgets, BAR_SIZE, opacity=BAR_OPACITY))]
