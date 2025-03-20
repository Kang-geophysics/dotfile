-- These are the basic's for using wezterm.
-- Mux is the mutliplexes for windows etc inside of the terminal
-- Action is to perform actions on the terminal
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

-- Start configuration
local config = wezterm.config_builder()

-- Color theme
config.color_scheme = "Gruvbox Dark (Gogh)"

-- Font settings
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 15

-- Appearance
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	top = 3,
	bottom = 1,
	left = 1,
	right = 1,
}

-- makes my cursor blink
config.default_cursor_style = "BlinkingBar"

-- key bindings
-- config.disable_default_key_bindings = true
config.leader = { key = "z", mods = "ALT", timeout_milliseconds = 3000 }
config.keys = {
	-- New Tab
	{
		key = "t",
		mods = "LEADER",
		action = act.SpawnCommandInNewTab,
	},
	-- Navigate to previous Tab
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	-- Navigate to next Tab
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	-- Split Pane
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "=",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Zoom pane
	{
		key = "z",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},
	-- Close pane
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	-- Navigate pane
	{
		mods = "LEADER",
		key = "j",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "h",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = act.ActivatePaneDirection("Right"),
	},
	-- Paste
	{
		mods = "CTRL",
		key = "v",
		action = act.PasteFrom("Clipboard"),
	},
}

-- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the defualt when opening Wezterm
config.default_domain = "WSL:Ubuntu-22.04"

return config
