return {
  "folke/trouble.nvim",
  keys = {
    { "gr", "<cmd>Trouble lsp_references<cr>", desc = "Go to references(Trouble)" },
    { "gd", "<cmd>Trouble lsp_definitions<cr>", desc = "Go to definitions(Trouble)" },
    { "<leader>xQ", false },
  },
  opts = {
    auto_close = true,
    action_keys = {
      open_vsplit = { "l" },
    },
  },
}
