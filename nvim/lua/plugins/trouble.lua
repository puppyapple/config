return {
  "folke/trouble.nvim",
  keys = {
    { "gr", "<cmd>Trouble lsp_references<cr>",  desc = "Go to references(Trouble)" },
    { "gd", "<cmd>Trouble lsp_definitions<cr>", desc = "Go to definitions(Trouble)" },
  },
  opts = {
    auto_close = true
  }
}
