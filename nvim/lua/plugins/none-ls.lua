local nls = require("null-ls")
return {
  "nvimtools/none-ls.nvim",
  opts = {
    sources = {
      nls.builtins.diagnostics.codespell.with({
        filetypes = { "python" },
      }),
      nls.builtins.formatting.black.with({
        filetypes = { "python" },
      }),
      -- nls.builtins.diagnostics.flake8,
    },
  },
}
