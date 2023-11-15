local wezterm = require("wezterm")
local M = {}
M.colors = {
	date_fg = "#fab387",
	date_bg = "#181825",
	battery_fg = "#f9e2af",
	battery_bg = "#181825",
	separator_fg = "#74c7ec",
	separator_bg = "#181825",
	server_bg = "#fc56b1",
}
local GLYPH_SEMI_CIRCLE_RIGHT = ""
M.cells = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)
M.push = function(text, icon, fg, bg, separate)
	table.insert(M.cells, { Foreground = { Color = fg } })
	table.insert(M.cells, { Background = { Color = bg } })
	table.insert(M.cells, { Attribute = { Intensity = "Bold" } })
	table.insert(M.cells, { Text = icon .. " " .. text .. " " })

	if separate then
		table.insert(M.cells, { Foreground = { Color = M.colors.server_bg } })
		table.insert(M.cells, { Background = { Color = M.colors.separator_bg } })
		table.insert(M.cells, { Text = GLYPH_SEMI_CIRCLE_RIGHT })
	end

	table.insert(M.cells, "ResetAttributes")
end

M.set_workspace = function(window)
	M.push(window:active_workspace(), " 󰣞", M.colors.battery_fg, M.colors.server_bg, true)
end

M.setup = function()
	wezterm.on("update-status", function(window, _pane)
		M.cells = {}
		M.set_workspace(window)

		window:set_left_status(wezterm.format(M.cells))
		-- window:set_left_status("xxxxx")
	end)
end

return M
