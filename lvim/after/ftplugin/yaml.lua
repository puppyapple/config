require('lspconfig')["yamlls"].setup({ capabilities = {} })
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "yamlfmt", filetypes = { "yaml" } } }

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "yamllint", filetypes = { "yaml" } } }
