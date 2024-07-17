return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    -- opts.defaults["<leader>c"] = "which_key_ignore"
    opts.spec["<leader>ca"] = "which_key_ignore"
    opts.spec["<leader>cf"] = "which_key_ignore"
  end,
}
