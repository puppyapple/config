-- Ondark theme
----------------------------------------------------------------------------------------------------------------
local my_highlight = {
  ["@function"] = { fg = "#2c56ff" },
  ["@parameter"] = { fmt = "italic" },
  ["@field"] = { fg = "#10deb5" },
  ["@variable"] = { fg = "#7b64ff" },
  ["@type"] = { fg = "#e00f9a" },
  ["@comment"] = { fg = "#278505" },
  ["@keyword"] = { fmt = "italic" },
  ["@keyword.operator"] = { fmt = "italic" },
  ["@function.builtin"] = { fmt = "italic" },
  ["@repeat"] = { fmt = "italic" },
  ["@conditional"] = { fmt = "italic" },
  ["@include"] = { fmt = "italic" },
  ["@variable.builtin"] = { fg = "#e5c07b" },
  ["@property"] = { fg = "red", fmt = "italic" },
  ["@local.definition"] = { fg = "red", fmt = "italic" },
  NvimTreeVertSplit = { fg = '$bg3', bg = '$bg0' }
}

require('onedark').setup {
  -- Main options --
  style = 'deep',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false,          -- Show/hide background
  term_colors = true,           -- Change terminal color as per the selected theme style
  ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  -- toggle theme style ---
  toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  toggle_style_list = {
    'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
  }, -- List of styles to toggle between

  -- Change code style --- Options are italic, bold, underline, none
  -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  code_style = {
    -- comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  -- Lualine options --

  lualine = {
    transparent = false -- lualine center bar transparency
  },

  -- Custom Highlights --
  -- MiniCursorword = { fmt = "underline" }, MiniCursorwordCurrent = { fmt = "underline" },
  colors = {
    black = '#000000'
  },                         -- Override default colors
  highlights = my_highlight, -- Override highlight groups

  -- Plugins Config --
  darker = true,      -- darker colors for diagnostic
  diagnostics = {
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true -- use background color for virtual text
  }
}
----------------------------------------------------------------------------------------------------------------







-- Tokyonight theme
----------------------------------------------------------------------------------------------------------------
local util = require("tokyonight.util")

require("tokyonight").setup {
  style = "night",
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "dark",          -- style for floating windows
  },
  on_colors = function(colors)
    colors.border = "#565f89"
  end,
  on_highlights = function(hl, c)
    hl.Hlargs = { fg = "#D49DA5" }
    hl.DiagnosticVirtualTextHint = { bg = util.darken(c.magenta, 0.1), fg = c.magenta }
    hl.DiagnosticVirtualTextError = { bg = util.darken("#ff0000", 0.1), fg = "#ff0000" }
    hl.Error = { fg = "#ff0000" }
    hl["@string.documentation"] = { fg = c.green }
    hl["@function"] = { fg = "#2c56ff" }
    hl["@constructor"] = { fg = c.yellow, bold = true }
    hl["@parameter"] = { fg = "#fc589a", style = { italic = true } }
    hl["@field"] = { fg = "#10deb5" }
    hl["@variable"] = { fg = "#7b64ff" }
    hl["@type"] = { fg = "#fa0265" }
    hl["@type.builtin"] = { fg = c.yellow }
    hl["@constant.builtin"] = { fg = c.yellow }
    hl["@keyword"] = { fg = "#d56ee0", style = { italic = true } }
    hl["@keyword.operator"] = { fg = "#d56ee0", style = { italic = true } }
    hl["@keyword.return"] = { fg = "#d56ee0", style = { italic = true } }
    hl["@method.call"] = { fg = "#3497d0", style = { italic = true } }
    hl["@repeat"] = { style = { fg = c.cyan, italic = true } }
    hl["@include"] = { style = { fg = c.cyan, italic = true } }
    hl["@conditional"] = { style = { fg = "#d56ee0", italic = true } }
    hl["@variable.builtin"] = { fg = "#e5c07b" }
    hl["@property"] = { fg = "red", style = { italic = true } }
    hl["@local.definition"] = { fg = "red", style = { italic = true } }
  end
}

----------------------------------------------------------------------------------------------------------------
