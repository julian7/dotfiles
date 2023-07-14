local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

config.color_scheme = 'Tomorrow Night'
config.font = wezterm.font('JetBrains Mono')
config.font_size = 15
config.line_height = 1.0
config.initial_cols = 130
config.initial_rows = 35
config.adjust_window_size_when_changing_font_size = false

config.keys = {
    { key = 'LeftArrow', mods = 'CMD', action = act.ActivateTabRelative(-1) },
    { key = 'RightArrow', mods = 'CMD', action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow', mods = 'OPT', action = act.SendString '\x1bb' },
    { key = 'RightArrow', mods = 'OPT', action = act.SendString '\x1bf' },
}

local ok, localconfig = pcall(require, "local")
if(ok) then
    localconfig.apply_to_config(config)
end

return config
