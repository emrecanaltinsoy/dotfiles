# Widgets

from libqtile import qtile
from libqtile import widget
from .colors import colors
from .general import TERMINAL, HOME_DIR, FONT_NERD


def python_icon(b_color, scale, file_dir):
    return [
        widget.Sep(
            linewidth=0, padding=6, background=b_color
        ),
        widget.Image(
            filename=file_dir,
            scale=scale,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(TERMINAL)
            },
        ),
        widget.Sep(
            linewidth=0, padding=6, background=b_color
        ),
    ]


def workspaces(workspace_colorscheme, font, font_size):
    return [
        widget.GroupBox(
            font=font,
            fontsize=font_size,
            disable_drag=True,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=3,
            borderwidth=3,
            rounded=False,

            active=workspace_colorscheme["active"],
            inactive=workspace_colorscheme["inactive"],
            highlight_method="line",  # ‘border’, ‘block’, ‘text’, or ‘line’
            highlight_color=workspace_colorscheme["active-tab-background"],
            this_current_screen_border=workspace_colorscheme["active_tab_border"],

            foreground=workspace_colorscheme["foreground"],
            background=workspace_colorscheme["background"],
        ),
        widget.Sep(
            linewidth=0, padding=4, foreground=workspace_colorscheme["foreground"], background=workspace_colorscheme["background"]
        ),
    ]


def layout(f_color, b_color, scale, file_dir):
    return [
        widget.CurrentLayoutIcon(
            custom_icon_paths=file_dir,
            foreground=f_color,
            background=b_color,
            scale=scale,
        ),
        widget.CurrentLayout(
            foreground=f_color, background=b_color, padding=5
        ),
    ]


def window_count(f_color, b_color, font_size, font):
    return [
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color
        ),
        widget.TextBox(
            text=" ",
            font=font,
            padding=2,
            foreground=f_color,
            background=b_color,
            fontsize=font_size,
        ),
        widget.WindowCount(
            foreground=f_color, background=b_color, padding=2, show_zero=True
        ),
        widget.Sep(
            linewidth=0, padding=4, foreground=f_color, background=b_color
        ),
    ]


def wallpaper(f_color, b_color, file_dir):
    return [
        widget.Sep(
            linewidth=0, padding=4, foreground=f_color, background=b_color
        ),
        widget.Wallpaper(
            directory=file_dir,
            # ["nitrogen", "--set-zoom-fill", "--random", "~/wallpapers"],
            wallpaper_command=['feh', '--bg-fill'],
            random_selection=True,
            foreground=f_color,
            background=b_color,
        ),
        widget.Sep(
            linewidth=0, padding=4, foreground=f_color, background=b_color
        ),
    ]


def window_name(f_color, b_color):
    return [
        widget.Sep(
            linewidth=0, padding=6, foreground=f_color, background=b_color
        ),
        widget.WindowName(
            foreground=f_color, background=b_color, padding=0
        ),
        widget.Sep(
            linewidth=0, padding=6, foreground=f_color, background=b_color
        ),
    ]


def network(f_color, b_color, font_size):
    return [
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color
        ),
        widget.Net(
            interface="wlp3s0",
            foreground=f_color,
            background=b_color,
            format="{down}↓↑{up}",
            fontsize=font_size,
        ),
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color
        ),
    ]


def check_updates(f_color, b_color, font, font_size):
    return [
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color,
        ),
        widget.TextBox(
            text="⟳",
            font=font,
            padding=2,
            foreground=f_color,
            background=b_color,
            fontsize=font_size,
        ),
        widget.CheckUpdates(
            update_interval=1800,
            distro="Debian",
            display_format="{updates} Updates",
            no_update_string="0 Updates",
            foreground=f_color,
            colour_no_updates=f_color,
            colour_have_updates=f_color,
            execute=TERMINAL + " -e sudo apt upgrade",
            background=b_color,
        ),
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color,
        ),
    ]


def memory_cpu(f_color, b_color, font, font_size):
    return [
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color,
        ),
        widget.TextBox(
            text="🖬 ",
            foreground=f_color,
            background=b_color,
            padding=0,
            fontsize=font_size,
        ),
        widget.Memory(
            foreground=f_color,
            background=b_color,
            padding=0,
            format="{MemUsed:.0f} MB",
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(TERMINAL + " -e htop")
            },
        ),
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color,
        ),
        widget.TextBox(
            text=" ",
            font=font,
            foreground=f_color,
            background=b_color,
            padding=0,
            fontsize=font_size
        ),
        widget.CPU(
            foreground=f_color,
            background=b_color,
            padding=0,
            format='{load_percent}% ',
            update_interval=1.0,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(TERMINAL + " -e htop")
            },
        ),
    ]


def volume(f_color, b_color, file_dir, font_size, font):
    return [
        widget.Sep(
            linewidth=0, padding=6, foreground=f_color, background=b_color
        ),
        widget.Volume(
            foreground=f_color,
            background=b_color,
            padding=0,
            # f"{HOME_DIR}/.config/qtile/volume-icons/Tela",
            theme_path=file_dir,
        ),
        widget.TextBox(
            text="墳 ",
            font=font,
            foreground=f_color,
            background=b_color,
            padding=0,
            fontsize=font_size,
        ),
        widget.Volume(
            foreground=f_color,
            background=b_color,
            padding=0,
            fontsize=font_size,
            update_interval=0.5,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn("pavucontrol")
            }
        ),
        widget.Sep(
            linewidth=0, padding=4, foreground=f_color, background=b_color
        ),
    ]


def date_time(f_color, b_color):
    return [
        widget.Sep(
            linewidth=0, padding=4, foreground=f_color, background=b_color
        ),
        widget.Clock(
            foreground=f_color,
            background=b_color,
            format="%A, %B %d - %H:%M ",
        ),
    ]


def brightness(f_color, b_color, font, font_size):
    return [
        widget.Sep(
            linewidth=0, padding=4, foreground=f_color, background=b_color
        ),
        widget.TextBox(
            text=" ",
            font=font,
            foreground=f_color,
            background=b_color,
            padding=0,
            fontsize=font_size,
        ),
        widget.Backlight(
            foreground=f_color,
            background=b_color,
            fontsize=font_size,
            backlight_name="intel_backlight",
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn("xfce4-power-manager-settings")
            }
        ),
    ]


def battery():
    return [
        widget.BatteryIcon(
            foreground=colors["group-names-font"],
            background=colors["widget1"],
            update_interval=1,
            theme_path=f"{HOME_DIR}/.config/qtile/battery-icons/Yaru",
        ),
        widget.Sep(
            linewidth=0, padding=4, foreground=colors["group-names-font"], background=colors["widget1"]
        ),
        widget.Battery(
            battery=0,
            format="{char}",
            foreground=colors["group-names-font"],
            background=colors["widget1"],
            low_foreground=colors["current-tab-border-line"],
            low_percentage=0.1,
            notify_below=35,
            charge_char=" ",
            discharge_char="",
            empty_char="",
            full_char="",
            unknown_char=" ",
            font=FONT_NERD,
            fontsize=12,
            update_interval=2,
            show_short_text=False,
            mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn("xfce4-power-manager-settings")
            }
        ),
        widget.Battery(
            battery=0,
            format="{percent:2.0%}",
            foreground=colors["group-names-font"],
            background=colors["widget1"],
            low_percentage=0.1,
            low_foreground=colors["current-tab-border-line"],
            notify_below=35,
            charge_char="",
            discharge_char="",
            empty_char="",
            full_char="",
            unknown_char="",
            fontsize=12,
            update_interval=2,
            show_short_text=False,
            mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn("xfce4-power-manager-settings")
            }
        ),
        widget.Sep(
            linewidth=0, padding=4, foreground=colors["group-names-font"], background=colors["widget1"]
        ),
    ]


def systemtray(f_color, b_color):
    return [
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color
        ),
        widget.Systray(
            background=b_color, padding=5),
        widget.Sep(
            linewidth=0, padding=5, foreground=f_color, background=b_color
        ),
    ]


def power_menu(f_color, b_color, font_size, font):
    return [
        widget.TextBox(
            text=" ⏻ ",
            foreground=f_color,
            background=b_color,
            font=font,
            padding=3,
            fontsize=font_size,
            mouse_callbacks={
                # lazy.shutdown(),
                "Button1": lambda: qtile.cmd_spawn(f"{HOME_DIR}/.dmenu-scripts/dmenu-power")
            }
        ),
    ]
