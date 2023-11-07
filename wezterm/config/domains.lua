return {
	-- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
	ssh_domains = {
		{
			name = "RServer",
			remote_address = "10.1.100.159",
			multiplexing = "WezTerm",
			remote_wezterm_path = "/usr/bin/wezterm",
			username = "puppyapple",
		},
	},

	-- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
	unix_domains = {},

	-- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
	wsl_domains = {
		-- {
		-- 	name = "WSL:Ubuntu",
		-- 	distribution = "Ubuntu",
		-- 	username = "kevin",
		-- 	default_cwd = "/home/kevin",
		-- 	default_prog = { "fish" },
		-- },
	},
}
