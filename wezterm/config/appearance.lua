local wezterm = require("wezterm")
local colors = require("colors.custom")
-- local fonts = require('config.fonts')

return {
	animation_fps = 100,
	max_fps = 100,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	underline_position = -4,
	underline_thickness = 3,

	-- color scheme
	colors = colors,

	-- background
	background = {
		{
			source = { File = wezterm.config_dir .. "/backdrops/space.jpg" },
		},
		{
			source = { Color = colors.background },
			height = "100%",
			width = "100%",
			opacity = 0.90,
		},
	},

	-- scrollbar
	enable_scroll_bar = false,

	-- tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = false,
	tab_max_width = 50,
	show_tab_index_in_tab_bar = true,
	switch_to_last_active_tab_when_closing_tab = true,

	-- window
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_close_confirmation = "NeverPrompt",
	window_frame = {
		active_titlebar_bg = "#090909",
		-- font = fonts.font,
		-- font_size = fonts.font_size,
	},
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
