local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 10.0

return config
