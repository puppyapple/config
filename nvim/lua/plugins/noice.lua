return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        filter = { event = "notify", find = 'No information available' },
        opts = { stop = true },
      },
    },
    notify = {
      enabled = true,
      view = "notify",
      top_down = false,
    },
    presets = {
      lsp_doc_border = true
    }
  }
}
