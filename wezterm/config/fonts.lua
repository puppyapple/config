local wezterm = require("wezterm")
local platform = require("utils.platform")

local font = "JetBrainsMono Nerd Font"
-- local font = "JetBrainsMonoNL Nerd Font"
local font_size = platform().is_mac and 15 or 9
return {
	-- font = wezterm.font(font, { weight = "DemiBold" }),
	font = wezterm.font_with_fallback({
		{ family = font, weight = "DemiBold" },
		{ family = "PingFang HK", weight = "DemiBold" },
	}),
	-- font = wezterm.font_with_fallback({
	-- 	font,
	-- 	-- This font has a broader selection of Chinese glyphs than my preferred font
	-- 	"DengXian",
	-- }),
	font_size = font_size,

	--ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
	freetype_load_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
	freetype_render_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
