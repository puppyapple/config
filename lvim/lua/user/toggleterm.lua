local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = { border = "curved" }
})

function lazygit_toggle() lazygit:toggle() end

lvim.builtin.which_key.mappings["gg"] = {
  "<cmd>lua lazygit_toggle()<cr>", "Lazygit"
}
