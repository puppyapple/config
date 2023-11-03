-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "<A-Down>", ":m+1<cr>")
vim.keymap.set("n", "<A-Up>", ":m-2<cr>")
vim.keymap.set("o", "H", "^")
vim.keymap.set("o", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")
vim.keymap.set("v", "Y", "<Plug>OSCYankVisual")
vim.api.nvim_del_keymap("n", "<leader>l")

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>k", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<leader>j", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Jump to buffer" })
map({ "v", "n", "s" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>i", "<cmd>lua require('swenv.api').pick_venv()<cr>", { desc = "Choose Env" })
map("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", { desc = "Peek definitions" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
map("n", "<leader>lu", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
map("n", "<c-/>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal (root dir)" })
map("t", "<c-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "<leader>gg", function()
  Util.terminal.open(
    { "lazygit" },
    { cwd = Util.root.get(), esc_esc = false, ctrl_hjkl = false, size = { width = 1, height = 1 } }
  )
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function()
  Util.terminal.open({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false, size = { width = 1, height = 1 } })
end, { desc = "Lazygit (cwd)" })
map("n", "<leader>gd", "<cmd>DiffviewFileHistory %<cr>", { desc = "Git diff view" })
map("n", "<leader>xd", "<cmd>TroubleClose<cr>", { desc = "Close Trouble Window" })
map("n", "<leader>fR", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})
map("n", "<leader>fc", "<cmd>lua require('spectre.actions').run_replace()<CR>", { desc = "Confirm Replace" })

map({ "n", "v" }, "<leader>cc", "<cmd>ChatGPT<CR>", { desc = "ChatGPT" })
map({ "n", "v" }, "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction" })
map({ "n", "v" }, "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "Grammar Correction" })
map({ "n", "v" }, "<leader>ct", "<cmd>ChatGPTRun translate<CR>", { desc = "Translate" })
map({ "n", "v" }, "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", { desc = "Keywords" })
map({ "n", "v" }, "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", { desc = "Docstring" })
map({ "n", "v" }, "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", { desc = "Add Tests" })
map({ "n", "v" }, "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "Optimize Code" })
map({ "n", "v" }, "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", { desc = "Summarize" })
map({ "n", "v" }, "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "Fix Bugs" })
map({ "n", "v" }, "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", { desc = "Explain Code" })
map({ "n", "v" }, "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", { desc = "Roxygen Edit" })
map({ "n", "v" }, "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", { desc = "Code Readability Analysis" })
