local pyright_opts = {
  root_dir = function(fname)
    local util = require("lspconfig.util")
    local root_files = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "manage.py",
      "pyrightconfig.json",
    }
    return util.root_pattern(unpack(root_files))(fname) or util.root_pattern(".git")(fname) or util.path.dirname(fname)
  end,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        -- reportGeneralTypeIssues = true,
      },
    },
  },
  single_file_support = true,
}
local format = function()
  require("lazyvim.plugins.lsp.format").format({ force = true })
end
return {
  "neovim/nvim-lspconfig",
  init = function()
    require('lspconfig.ui.windows').default_options.border = 'rounded'
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<leader>ca", false, mode = { "n", "v" } }
    keys[#keys + 1] = { "<leader>cA", false }
    keys[#keys + 1] = { "gr", false }
    keys[#keys + 1] = { "gd", false }
    keys[#keys + 1] = { "<leader>cd", false }
    keys[#keys + 1] = { "<leader>cf", false }
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = {
      "<leader>la",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      mode = { "n", "v" },
      has = "codeAction",
    }
    keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    keys[#keys + 1] = { "<leader>ff", format, desc = "Format Document", has = "formatting" }
    keys[#keys + 1] = { "<leader>ff", format, desc = "Format Range", mode = "v", has = "rangeFormatting" }
  end,
  opts = {
    format = { timeout_ms = 3000 },
    servers = {
      pyright = pyright_opts,
      ruff_lsp = {},
    },
  },
}
