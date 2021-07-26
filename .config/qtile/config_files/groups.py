# Qtile workspaces
from libqtile.config import Key, Group, Match
from libqtile.command import lazy
from .keys import mod, keys

group_names = [(" ", {'layout': 'max',
                       'matches': [Match(wm_class=["Firefox", "brave-browser"])]
                       }),
               (" ", {'layout': 'max',
                       'matches': [Match(wm_class=["code", "kdevelop", "VSCodium", "Geany", "Emacs"])]
                       }),
               (" ", {'layout': 'monadtall',
                       'matches': [Match(wm_class=["Alacritty"])]
                       }),
               (" ", {'layout': 'monadtall',
                       'matches': [Match(wm_class=["mailspring", "TelegramDesktop", "Rocket.Chat"])]
                       }),
               (" ", {'layout': 'monadtall',
                       'matches': [Match(wm_class=["Org.gnome.Nautilus"])]
                       }),
               (" ", {'layout': 'max',
                       'matches': [Match(wm_class=["Ardour", "Zrythm"], title=["Session Setup", "Audio/MIDI Setup"])]
                       }),
               (" ", {'layout': 'monadtall',
                       'matches': [Match(wm_class=["Spotify", "vlc"])]
                       }),
               (" ", {'layout': 'max',
                       'matches': [Match(wm_class=["Inkscape", "Gimp"])]
                       }),
               (" ", {'layout': 'max',
                       'matches': [Match(wm_class=["Steam"])]
                       })]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(
        Key([mod], str(i), lazy.group[name].toscreen())
    )  # Switch to another group
    keys.append(
        Key([mod, "shift"], str(i), lazy.window.togroup(name))
    )  # Send current window to another group
