local wezterm = require("wezterm")
local math = require("utils.math")
local M = {}

M.separator_char = "| "
-- M.separator_char = utf8.char(0xe0b2)

M.colors = {
	date_fg = "#fab387",
	date_bg = "#181825",
	battery_fg = "#f9e2af",
	battery_bg = "#181825",
	separator_fg = "#74c7ec",
	separator_bg = "#181825",
	text_fg = "#c0c0c0",
}

-- The powerline < symbol
local LEFT_ARROW = utf8.char(0xe0b3)
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- Color palette for the backgrounds of each cell
local colors = {
	"#3c1361",
	"#52307c",
	"#663a82",
	"#7c5295",
	"#b491c8",
}
M.cells = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)

---@param text string
---@param icon string
---@param fg string
---@param bg string
---@param separate boolean
M.push = function(text, icon, fg, bg, separate)
	table.insert(M.cells, { Foreground = { Color = fg } })
	table.insert(M.cells, { Background = { Color = bg } })
	table.insert(M.cells, { Attribute = { Intensity = "Bold" } })
	table.insert(M.cells, { Text = icon .. " " .. text .. " " })

	if separate then
		table.insert(M.cells, { Foreground = { Color = M.colors.separator_fg } })
		table.insert(M.cells, { Background = { Color = M.colors.separator_bg } })
		table.insert(M.cells, { Text = M.separator_char })
	end

	table.insert(M.cells, "ResetAttributes")
end

M.set_date = function()
	local date = wezterm.strftime(" %m-%d %a")
	M.push(date, "", M.colors.date_fg, M.colors.date_bg, true)
end

M.set_battery = function()
	-- ref: https://wezfurlong.org/wezterm/config/lua/wezterm/battery_info.html
	local discharging_icons = { "", "", "", "", "", "", "", "", "", "" }
	local charging_icons = { "", "", "", "", "", "", "", "", "", "" }

	local charge = ""
	local icon = ""

	for _, b in ipairs(wezterm.battery_info()) do
		local idx = math.clamp(math.round(b.state_of_charge * 10), 1, 10)
		charge = string.format("%.0f%%", b.state_of_charge * 100)

		if b.state == "Charging" then
			icon = charging_icons[idx]
		else
			icon = discharging_icons[idx]
		end
	end

	M.push(charge, icon, M.colors.battery_fg, M.colors.battery_bg, false)
end

M.set_workspace = function(window)
	M.push(window:active_workspace(), " 󰣞", M.colors.battery_fg, M.colors.battery_bg, true)
end

M.set_test = function(pane)
	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			-- Running on a newer version of wezterm and we have
			-- a URL object here, making this simple!

			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		else
			-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
			-- which doesn't have the Url object
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				hostname = cwd_uri:sub(1, slash - 1)
				-- and extract the cwd from the uri, decoding %-encoding
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		-- Remove the domain name portion of the hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		table.insert(M.cells, cwd)
		table.insert(M.cells, hostname)
	end

	-- I like my date/time in this style: "Wed Mar 3 08:14"
	-- local date = wezterm.strftime("%a %b %-d %H:%M")
	local date = wezterm.strftime(" %m-%d %a")
	table.insert(M.cells, "" .. " " .. date .. " ")
	-- M.push(date, "", M.colors.date_fg, M.colors.date_bg, true)

	-- An entry for each battery (typically 0 or 1 battery)
	-- for _, b in ipairs(wezterm.battery_info()) do
	-- 	table.insert(M.cells, string.format("%.0f%%", b.state_of_charge * 100))
	-- end
	local discharging_icons = { "", "", "", "", "", "", "", "", "", "" }
	local charging_icons = { "", "", "", "", "", "", "", "", "", "" }

	local charge = ""
	local icon = ""

	for _, b in ipairs(wezterm.battery_info()) do
		local idx = math.clamp(math.round(b.state_of_charge * 10), 1, 10)
		charge = string.format("%.0f%%", b.state_of_charge * 100)

		if b.state == "Charging" then
			icon = charging_icons[idx]
		else
			icon = discharging_icons[idx]
		end
	end
	table.insert(M.cells, icon .. " " .. charge .. " ")
	-- M.push(charge, icon, M.colors.battery_fg, M.colors.battery_bg, false)
end

M.setup = function()
	wezterm.on("update-right-status", function(window, _pane)
		M.cells = {}
		-- M.set_workspace(window)
		-- M.set_date()
		-- M.set_battery()
		M.set_test(_pane)
		-- The elements to be formatted
		local elements = {}
		-- How many cells have been formatted
		local num_cells = 0

		-- Translate a cell into elements
		function push(text, is_last)
			local cell_no = num_cells + 1
			table.insert(elements, { Foreground = { Color = M.colors.text_fg } })
			table.insert(elements, { Background = { Color = colors[cell_no] } })
			table.insert(elements, { Text = " " .. text .. " " })
			if not is_last then
				table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
				table.insert(elements, { Text = SOLID_LEFT_ARROW })
			end
			num_cells = num_cells + 1
		end

		while #M.cells > 0 do
			local cell = table.remove(M.cells, 1)
			push(cell, #M.cells == 0)
		end

		window:set_right_status(wezterm.format(elements))
	end)
end

return M
