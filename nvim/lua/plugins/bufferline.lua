return {
  "akinsho/bufferline.nvim",
  lazy = true,
  opts = {
    highlights = {
      indicator_selected = { bg = "#F5C2E7", fg = "#F5C2E7", underline = true },
      -- fill = {
      --   bg = {
      --     attribute = "bg",
      --     highlight = "Pmenu",
      --   },
      -- },
      -- background = {
      --   fg = { attribute = "fg", highlight = "Pmenu" },
      --   bg = { attribute = "bg", highlight = "Pmenu" },
      -- },
    },
    options = {
      max_name_length = 20,
      -- tab_size = 30,
      truncate_names = false,
      show_buffer_close_icons = false,
      always_show_bufferline = true,
      -- separator_style = "slant",
      separator_style = "thin",
      indicator = { style = "icon", icon = " 󰂮 " },
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
          highlight = "Directory",
          separator = true,
          -- padding = 0.3,
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
