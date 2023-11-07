local wezterm = require("wezterm")
local platform = require("utils.platform")()
local act = wezterm.action

local mod = {}

if platform.is_mac then
	mod.SUPER = "SUPER"
	mod.SUPER_REV = "CTRL|SHIFT"
elseif platform.is_win then
	mod.SUPER = "ALT" -- to not conflict with Windows key shortcuts
	mod.SUPER_REV = "ALT|CTRL"
end

local keys = {
	-- misc/useful --
	{ key = "F1", mods = "NONE", action = "ActivateCopyMode" },
	{ key = "F2", mods = "NONE", action = act.ActivateCommandPalette },
	{ key = "F3", mods = "NONE", action = act.ShowLauncher },
	{ key = "F4", mods = "NONE", action = act.ShowTabNavigator },
	{ key = "F12", mods = "NONE", action = act.ShowDebugOverlay },
	{ key = "f", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },

	-- copy/paste --
	{ key = "c", mods = mod.SUPER, action = act.CopyTo("Clipboard") },
	{ key = "v", mods = mod.SUPER, action = act.PasteFrom("Clipboard") },

	-- tabs --
	-- tabs: spawn+close
	{ key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
	{ key = "t", mods = mod.SUPER_REV, action = act.SpawnTab({ DomainName = "RServer" }) },
	{ key = "w", mods = mod.SUPER, action = act.CloseCurrentTab({ confirm = false }) },

	-- tabs: navigation
	{ key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
	-- { key = "[", mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
	-- { key = "]", mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

	-- window --
	-- spawn windows
	{ key = "n", mods = mod.SUPER, action = act.SpawnWindow },
	{ key = "q", mods = mod.SUPER, action = act.QuitApplication },

	-- panes --
	-- panes: split panes
	{
		key = [[d]],
		mods = mod.SUPER,
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = [[Return]],
		mods = mod.SUPER,
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- panes: zoom+close pane
	{ key = "z", mods = mod.SUPER, action = act.TogglePaneZoomState },
	{ key = "w", mods = mod.SUPER_REV, action = act.CloseCurrentPane({ confirm = false }) },

	-- panes: navigation
	{ key = "k", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Down") },
	{ key = "[", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Left") },
	{ key = "]", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Right") },

	-- key-tables --
	-- resizes fonts
	{
		key = "f",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_font",
			one_shot = false,
			timemout_miliseconds = 1000,
		}),
	},
	-- resize panes
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			timemout_miliseconds = 1000,
		}),
	},
	{
		key = "A",
		mods = mod.SUPER_REV,
		action = wezterm.action.AttachDomain("Server"),
	},
	-- workspaces --
	{ key = "[", mods = "SUPER|SHIFT", action = act.SwitchWorkspaceRelative(-1) },
	{ key = "]", mods = "SUPER|SHIFT", action = act.SwitchWorkspaceRelative(1) },
	-- { key = "9", mods = "ALT", action = wezterm.action.ShowLauncher },
	{
		key = "N",
		mods = "SUPER|SHIFT",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "P",
		mods = "SUPER|SHIFT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

for i = 1, 8 do
	table.insert(keys, {
		key = tostring(i),
		mods = mod.SUPER,
		action = act.ActivateTab(i - 1),
	})
end

local key_tables = {
	resize_font = {
		{ key = "k", action = act.IncreaseFontSize },
		{ key = "j", action = act.DecreaseFontSize },
		{ key = "r", action = act.ResetFontSize },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
	resize_pane = {
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
	},
}

local mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}

return {
	disable_default_key_bindings = true,
	leader = { key = "Space", mods = "SUPER|SHIFT" },
	keys = keys,
	key_tables = key_tables,
	mouse_bindings = mouse_bindings,
}
