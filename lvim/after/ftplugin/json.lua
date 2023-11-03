-- require("lvim.lsp.manager").setup("pyright")
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {{command = "prettier", filetypes = {"json"}}}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {{command = "codespell", filetypes = {"json"}}}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {{command = "proselint"}}
