local wezterm = require 'wezterm'
local act = wezterm.action
--local mux = wezterm.mux

local config = {}

config.color_scheme = 'Tomorrow Night'
config.colors = {
    scrollbar_thumb = '#555',
}
config.font = wezterm.font('JetBrains Mono')
config.font_size = 15
config.line_height = 1.0
--config.initial_cols = 120
config.initial_cols = 130
config.initial_rows = 35
config.adjust_window_size_when_changing_font_size = true
config.adjust_window_size_when_changing_font_size = false
config.enable_scroll_bar = true
config.scrollback_lines = 10000

config.keys = {
    { key = 'LeftArrow', mods = 'CMD', action = act.ActivateTabRelative(-1) },
    { key = 'RightArrow', mods = 'CMD', action = act.ActivateTabRelative(1) },
    { key = '0', mods = 'CMD|OPT', action = act.ResetFontAndWindowSize },
    { key = 'LeftArrow', mods = 'OPT', action = act.SendString '\x1bb' },
    { key = 'RightArrow', mods = 'OPT', action = act.SendString '\x1bf' },
}

config.mouse_bindings = {
    { event = { Up = { streak = 1, button = 'Left' } }, mods = 'NONE', action = act.CompleteSelection 'ClipboardAndPrimarySelection' },
    { event = { Up = { streak = 1, button = 'Left' } }, mods = 'OPT', action = act.OpenLinkAtMouseCursor },
}
local ok, localconfig = pcall(require, "local")
if(ok) then
    localconfig.apply_to_config(config)
end

return config
