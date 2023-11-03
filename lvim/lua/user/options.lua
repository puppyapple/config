lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 15
lvim.builtin.bufferline.options.separator_style = "slant"
lvim.builtin.bufferline.options.indicator.style = "underline"
lvim.builtin.bufferline.options.always_show_bufferline = true

-- vim.diagnostic.config({ virtual_text = true })
lvim.builtin.cmp.cmdline.enable = true
lvim.builtin.cmp.experimental.ghost_text = true
-- lvim.builtin.breadcrumbs.active = true
-- vim.diagnostic.config({ update_in_insert = true })
lvim.lsp.installer.setup.automatic_installation = true
-- table.insert(lvim.builtin.cmp.sources, {name = "pandoc_references"})
-- table.insert(lvim.builtin.cmp.sources, {name = "nvim_lsp_signature_help"})
local cmp = require("cmp")
lvim.builtin.cmp.sorting = {
  comparators = {
    cmp.config.compare.offset, cmp.config.compare.exact,
    cmp.config.compare.score, require "cmp-under-comparator".under,
    cmp.config.compare.recently_used, cmp.config.compare.locality,
    cmp.config.compare.kind, cmp.config.compare.sort_text,
    cmp.config.compare.length, cmp.config.compare.order
  }
}
vim.highlight.on_yank { timeout = 2000 }
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.renderer.highlight_git = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.git_placement = "before"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = {
  unstaged = "✗",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "◌"
}
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx",
  "css", "rust", "java", "yaml"
}

-- vim.api.nvim_set_hl(0, "Normal", { fg = "#000000", bg = "#000000" })
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.lsp.on_attach_callback = function(client, bufnr)
  require "lsp_signature".on_attach()
end
-- lvim.builtin.treesitter.highlight.enable = true
local options = { scrolloff = 0, sidescrolloff = 8, updatetime = 100 }
for k, v in pairs(options) do vim.opt[k] = v end

-- vim.g.clipboard = {
--     name = "my",
--     copy = {
--         ['+'] = 'kitty +kitten clipboard',
--         ['*'] = 'kitty +kitten clipboard'
--     },
--     paste = {
--         ['+'] = 'kitty +kitten clipboard --get-clipboard',
--         ['*'] = 'kitty +kitten clipboard --get-clipboard'
--     }
-- }
-- vim.g.clipboard = {
--     name = 'myClipboard',
--     copy = {
--         ['+'] = {'tmux', 'load-buffer', '-'},
--         ['*'] = {'tmux', 'load-buffer', '-'}
--     },
--     paste = {
--         ['+'] = {'tmux', 'save-buffer', '-'},
--         ['*'] = {'tmux', 'save-buffer', '-'}
--     }
-- }
