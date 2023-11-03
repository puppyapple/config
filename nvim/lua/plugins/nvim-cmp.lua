local cmp = require("cmp")
return {
  "hrsh7th/nvim-cmp",
  opts = {
    sources = {
      { name = "codeium", group_index = 2 },
      { name = "copilot", group_index = 2 },
      { name = "nvim_lsp", group_index = 2 },
      { name = "luasnip", group_index = 2 },
      { name = "buffer", group_index = 2 },
      { name = "path", group_index = 2 },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        require("copilot_cmp.comparators").prioritize,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        require("cmp-under-comparator").under,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = { hlgroup = "Comment" },
    },
  },
}
