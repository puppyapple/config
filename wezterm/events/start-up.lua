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
		-- may as well kick off a build in that pane
		-- build_pane:send_text("cargo build\n")

		local tab_1, pane_1, window_1 = mux.spawn_window({
			workspace = "Ubuntu",
			-- domain = { DomainName = "SSH:ubuntu" },
			-- domain = { DomainName = "RServer" },
			-- cwd = project_dir,
			args = args,
		})

		-- We want to startup in the coding workspace
		mux.set_active_workspace("Ubuntu")
	end)
end
return M
