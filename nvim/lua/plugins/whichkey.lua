return {
  "folke/which-key.nvim",
  opts = {
    window = {
      border = "single",
    },
    defaults = {
      ["<leader>l"] = { name = "+LSP" },
      ["<leader>c"] = { name = "+ChatGPT" },
    }
  },
  -- config = function(_, opts)
  --   wk.register(opts.defaults)
  -- end,
}
