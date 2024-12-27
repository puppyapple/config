local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

M.setup = function()
	wezterm.on("gui-startup", function(cmd)
		-- allow `wezterm start -- something` to affect what we spawn
		-- in our initial window
		local args = {}
		if cmd then
			args = cmd.args
		end

		-- Set a workspace for coding on a current project
		-- Top pane is for the editor, bottom pane is for the build tool
		local project_dir = wezterm.home_dir .. "/wezterm"
		local tab, local_pane, window = mux.spawn_window({
			workspace = "MAC",
			cwd = project_dir,
			args = args,
		})

		-- local tab_1, pane_1, window_1 = mux.spawn_window({
		-- 	workspace = "Ubuntu",
		-- 	args = args,
		-- })

		-- We want to startup in the coding workspace
	end)
end
return M
