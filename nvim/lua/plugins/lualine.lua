local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local icons = require("lazyvim.config").icons
local Util = require("lazyvim.util")

-- mode
local mode = {
  function()
    return " 👽"
  end,
  padding = { left = 0, right = 0 },
  color = {},
  cond = nil,
  separator = {
    -- left = "",
    left = "",
    right = "",
  },
  left_padding = 2,
}

-- python_env
local window_width_limit = 100
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.o.columns > window_width_limit
  end,
}
local function env_cleanup(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch("([^/]+)") do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end
local python_env = {
  function()
    -- local utils = require("lvim.core.lualine.utils")
    if vim.bo.filetype == "python" then
      local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
      for _, client in pairs(vim.lsp.get_active_clients()) do
        if client.name == "pyright" then
          -- Check if lsp was initialized with py_lsp
          if client.config.settings.python["pythonPath"] ~= nil then
            local venv_tmp = client.config.settings.python.venv_name
            if venv_tmp ~= "anaconda3" and venv_tmp ~= "miniconda3" then
              venv = venv_tmp
            end
          end
        end
      end
      if venv then
        local devicons = require("nvim-web-devicons")
        local py_icon, _ = devicons.get_icon(".py")
        return string.format(" " .. py_icon .. " (%s)", env_cleanup(venv))
      end
    end
    return ""
  end,
  color = { fg = colors.orange },
  cond = conditions.hide_in_width,
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = { section_separators = { left = "", right = "" }, component_separators = "|", theme = "tokyonight" },
    sections = {
      lualine_a = { mode },
      lualine_b = { { "branch", color = { fg = colors.purple } } },
      lualine_c = {
        python_env,
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
        },
        -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        -- {
        --   "filename",
        --   color = { fg = colors.cyan },
        --   path = 1,
        --   symbols = { modified = "  ", readonly = "", unnamed = "" },
        -- },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
          -- cond = conditions.hide_in_width,
        },
        -- stylua: ignore
        {
          function() return require("nvim-navic").get_location() end,
          cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
        },
      },
      lualine_x = {
        -- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = Util.ui.fg("Statement"),
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = Util.ui.fg("Constant"),
        },
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = Util.ui.fg("Debug"),
        },
        { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.ui.fg("Special") },
      },
      lualine_z = {
        function()
          return " " .. os.date("%m-%d %R", os.time())
        end,
      },
    },
  },
}
