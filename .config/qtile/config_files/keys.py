# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy
from .general import HOME_DIR, TERMINAL

mod = "mod4"

keys = [
    # dmenu
    Key([mod], "p", lazy.spawn(
        f"{HOME_DIR}/.dmenu-scripts/dmenu-prompt"), desc="Run Dmenu",),
    # dmenu options (scripts)
    Key([mod, "control"], "p", lazy.spawn(
        f"{HOME_DIR}/.dmenu-scripts/dmenu-options"), desc="Run Dmenu",),
    # dmenu keycoards
    # KeyChord([mod], "p", [
    #     # Key([], "p", lazy.spawn(
    #     #     f"{HOME_DIR}/.dmenu-scripts/dmenu-prompt"), desc="Run Dmenu",),
    #     Key([], "o", lazy.spawn(
    #         f"{HOME_DIR}/.dmenu-scripts/dmenu-options"), desc='Run Dmenu Options',),
    #     Key([], "c", lazy.spawn(
    #         f"{HOME_DIR}/.dmenu-scripts/dmenu-confedit"), desc='Run Dmenu Config Edit',),
    #     Key([], "w", lazy.spawn(
    #         f"{HOME_DIR}/.dmenu-scripts/dmenu-websearch"), desc='Run Dmenu Websearch',),
    #     Key([], "q", lazy.spawn(
    #         f"{HOME_DIR}/.dmenu-scripts/dmenu-power"), desc='Run Dmenu Power Menu',),
    #     Key([], "k", lazy.spawn(
    #         f"{HOME_DIR}/.dmenu-scripts/dmenu-killprocess"), desc='Run Dmenu Kill Process',),
    #     Key([], "i", lazy.spawn(
    #         f"{HOME_DIR}/.dmenu-scripts/dmenu-wifi"), desc='Run Dmenu Wifi',),
    # ]),

    # Launch Terminal
    Key([mod], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Kill the current window
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    # Restart Qtile
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    # Change Wallpaper
    Key([mod], "F2", lazy.spawn(
        f"nitrogen --set-zoom-fill --random {HOME_DIR}/wallpapers"), desc="Change wallpaper",),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right",),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow and shrink windows in monadtall layout
    Key([mod, "control"], "h", lazy.layout.shrink_main(),
        desc="Shrink master window"),
    Key([mod, "control"], "l", lazy.layout.grow_main(),
        desc="Grow master window"),
    Key([mod, "control"], "j", lazy.layout.grow(), desc="Grow window"),
    Key([mod, "control"], "k", lazy.layout.shrink(), desc="Shrink window"),

    # Reset windows Sizes
    Key([mod, "control"], "n", lazy.layout.reset(),
        desc="Reset all window sizes"),
    # Toggle floating
    Key([mod], "f", lazy.window.toggle_floating(), desc='toggle floating'),
    # Toggle fullscreen
    Key([mod], "m", lazy.window.toggle_fullscreen(), desc='toggle fullscreen'),

    # Fn Keys
    Key([], "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioMute",
            lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([], "XF86MonBrightnessUp",
            lazy.spawn("xbacklight -inc 5%")),
    Key([], "XF86MonBrightnessDown",
            lazy.spawn("xbacklight -dec 5%")),
    Key([], "XF86AudioPlay",
            lazy.spawn("playerctl -a play")),
    Key([], "XF86AudioPause",
            lazy.spawn("playerctl -a pause")),
    Key([], "XF86AudioStop",
            lazy.spawn("playerctl -a stop")),
    Key([], "XF86AudioNext",
            lazy.spawn("playerctl -a next")),
    Key([], "XF86AudioPrev",
            lazy.spawn("playerctl -a previous")),
]
