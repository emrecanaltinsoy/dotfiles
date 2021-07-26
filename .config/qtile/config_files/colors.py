# Colors

from os import path
from yaml import load, Loader
from pathlib import Path
from .general import THEME, CONFIG_DIR


def load_colorscheme(theme_name="default"):
    """Function to load colorscheme file (yml)

    Args:
        theme_name (str, optional): name of the colorscheme yml file. Defaults to "default".

    Returns:
        dict: colorscheme dictionary
    """
    theme_path = f"{CONFIG_DIR}/color_schemes/{theme_name}.yml"
    if path.isfile(theme_path):
        with open(theme_path) as f:
            theme = load(f, Loader=Loader)
        return theme

    # If colorscheme file does not exist, use the following colorscheme
    return {
        "panel-background": "#282c34",          # panel background
        "group-names-font": "#ffffff",          # font color for group names
        "window-name": "#e1acff",               # window name
        "widget1": "#74438f",                   # widget color 1
        "widget2": "#4f76c7",                   # widget color 2
        "workspace_colors": {                   # workspace colors
            "active": "#ffffff",                # active tab color
            "inactive": "#4c566a",              # inactive tab color
            "foreground": "#ffffff",            # foreground
            "background": "#282c34",            # background
            "active_tab_border": "#e1acff",     # active tab border color
            "active-tab-background": "#3d3f4b",  # active tab background
        }
    }


colors = load_colorscheme(theme_name=THEME)
