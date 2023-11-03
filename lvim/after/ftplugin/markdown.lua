require('lspconfig')["marksman"].setup({ capabilities = {} })
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "prettier", filetypes = { "markdown" } }, {
  command = "markdown-toc",
  filetypes = { "markdown" }
} }

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "markdownlint", filetypes = { "markdown" } } }
