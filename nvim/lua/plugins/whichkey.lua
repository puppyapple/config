return {
  "folke/which-key.nvim",
  opts = {
    win = {
      border = "single",
    },
    spec = {
      ["<leader>l"] = { name = "+LSP" },
      ["<leader>c"] = { name = "+Code" },
      ["<leader>n"] = { name = "+Docstring(Neogen)" },
    },
  },
  -- config = function(_, opts)
  --   wk.register(opts.defaults)
  -- end,
}
