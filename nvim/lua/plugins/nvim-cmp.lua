local cmp = require("cmp")
local cmp_mapping = cmp.mapping.preset.insert({
  -- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  -- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-s>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  ["<S-CR>"] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  ["<C-CR>"] = function(fallback)
    cmp.abort()
    fallback()
  end,
})
cmp_mapping["<C-n>"] = vim.NIL
cmp_mapping["<C-p>"] = vim.NIL

return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    return {
      sources = {
        { name = "codeium", group_index = 2 },
        -- { name = "copilot", group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "path", group_index = 2 },
      },
      -- mapping = cmp_mapping,
      mapping = cmp.mapping.preset.insert(vim.tbl_deep_extend("force", opts.mapping, { ["<C-n>"] = vim.NIL })),
      sorting = {
        priority_weight = 2,
        comparators = {
          -- require("copilot_cmp.comparators").prioritize,
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
      -- experimental = {
      --   ghost_text = { hlgroup = "Comment" },
      -- },
    }
  end,
}
