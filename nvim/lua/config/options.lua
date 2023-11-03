-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.cursorcolumn = true
vim.diagnostic.config({
  float = {
    border = "rounded",
  },
})
vim.opt.splitkeep = "cursor"
-- local get_filename = function(path)
--   local filename_with_relative_path = vim.fn.substitute(path, vim.fn.getcwd() .. "/", "", "")
--   local filename = filename_with_relative_path:match("([^/]+)$")
--
--   if filename == "" or filename == nil then
--     return " %f"
--   end
--
--   return filename
-- end
--
-- local filename = get_filename(vim.fn.expand("%"))
-- vim.o.winbar = " " .. filename .. " > " .. "%{%v:lua.require'nvim-navic'.get_location()%}"
