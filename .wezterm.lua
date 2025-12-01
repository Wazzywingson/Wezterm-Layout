local wezterm = require "wezterm"
local act = wezterm.action
local config = wezterm.config_builder()

-- terminal
-- config.front_end = "OpenGL"
config.prefer_egl = true
config.max_fps = 144
config.initial_cols = 90
config.initial_rows = 20
config.term = "xterm-256color"
config.default_prog = { "bash" }

-- window
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	font = wezterm.font({ family = "IosevkaTerm NFM", weight = "Bold" }),
	active_titlebar_bg = "#0c0b0f",
}

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

config.use_fancy_tab_bar = false
-- config.tab_bar_at_bottom = true

-- cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500

-- fonts
config.font = wezterm.font_with_fallback ({

    "IosevkaTerm NFM Heavy",
    "Symbols Nerd Font Mono"

})

config.font_size = 16

-- keymaps
config.keys = {
	{
		key = "E",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.EmitEvent("toggle-colorscheme"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "U",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "I",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
	{
		key = "O",
		mods = "CTRL|ALT",
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.9
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}

-- colorscheme
config.color_scheme_dirs = { "C:/Users/migue/wezterm/colors/" }
config.color_scheme = "AtomOneDark"
config.colors = {
	--background = "color",
	--foreground = "color",
	--cursor_border = "color",
	--cursor_fg = "color",
	--cursor_bg = "color",
	--selection_fg = "color",

	tab_bar = {
		--background = "color",
		active_tab = {
			bg_color = "#21252b",
			fg_color = "#abb2bf",
			--intensity = "Normal",
			--underline = "None",
			--italic = false,
			--strikethrough = false,
		},
		--inactive_tab = {
			--bg_color = "color",
			--fg_color = "color",
			--intensity = "Normal",
			--underline = "None",
			--italic = false,
			--strikethrough = false,
		--},

		--new_tab = {
			--bg_color = "color",
			--fg_color = "color",
		--},
	},
}


return config
