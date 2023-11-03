return {
  "akinsho/bufferline.nvim",
  lazy = true,
  opts = {
    highlights = {
      buffer_selected = { bold = true, italic = true },
      separator = { fg = "NONE" },
      separator_selected = { fg = "NONE" },
    },
    options = {
      show_buffer_close_icons = false,
      always_show_bufferline = true,
      -- separator_style = "slant",
      separator_style = "thin",
      indicator = { style = "underline" },
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "DiffviewFiles",
          text = "Diff View",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          highlight = "PanelHeading",
        },
        {
          filetype = "lazy",
          text = "Lazy",
          highlight = "PanelHeading",
          padding = 1,
        },
      },
    },
  },
}
