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
config.font_size = 17

-- Appearance
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
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
config.leader = { key = "x", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
	-- New Tab
	{
		key = "t",
		mods = "LEADER",
		action = act.SpawnCommandInNewTab,
	},
	-- New Tab
	{
		key = "w",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
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
		key = '"',
		mods = "LEADER|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER|SHIFT",
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
	-- Adjust pane size
	{
		key = "J",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "H",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "L",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	-- Navigate to other pane
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	-- Swap the active pane with other panes
	{
		key = "{",
		mods = "LEADER|SHIFT",
		action = act.RotatePanes("CounterClockwise"),
	},
	{
		key = "}",
		mods = "LEADER|SHIFT",
		action = act.RotatePanes("Clockwise"),
	},
	-- Paste
	{
		key = "v",
		mods = "CTRL",
		action = act.PasteFrom("Clipboard"),
	},
}

-- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the defualt when opening Wezterm
config.default_domain = "WSL:Ubuntu-22.04"

return config
