local components = require "lvim.core.lualine.components"
local conditions = require "lvim.core.lualine.conditions"
local colors = require "lvim.core.lualine.colors"
local python_env = {
  function()
    local utils = require "lvim.core.lualine.utils"
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV" or
          os.getenv "VIRTUAL_ENV"
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
        local icons = require "nvim-web-devicons"
        local py_icon, _ = icons.get_icon ".py"
        return string.format(" " .. py_icon .. " (%s)",
          utils.env_cleanup(venv))
      end
    end
    return ""
  end,
  color = { fg = colors.orange },
  cond = conditions.hide_in_width
}
lvim.builtin.lualine.style = "lvim"
local mode = {
  function()
    return '👽'
  end,
  padding = { left = 0, right = 0 },
  color = {},
  cond = nil,
  separator = { left = '', right = '' },
  left_padding = 2
}

-- local lsp = {
--   function()
--     local msg = 'No Active Lsp'
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = ' LSP:',
--   color = { fg = '#ffffff', gui = 'bold' }
-- }

-- components.lsp = lsp
components.branch.color = { fg = colors.purple }
components.filename.color = { fg = colors.cyan }
components.lsp.color = { fg = colors.yellow }
components.location.color = { fg = colors.blue }
components.spaces.color = { fg = colors.violet }

lvim.builtin.lualine.sections.lualine_a = { mode }
lvim.builtin.lualine.sections.lualine_b = { components.branch }
lvim.builtin.lualine.sections.lualine_c = {
  components.diff, python_env, components.filename
}
lvim.builtin.lualine.sections.lualine_z = {
  { 'os.date("%H:%M:%S")', separator = { left = '', right = '' }, left_padding = 2 },
}
-- lvim.builtin.lualine.sections.lualine_a.seperator = { left = '', right = '' }
-- lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
-- lvim.builtin.lualine.options.component_separators = { left = '', right = '' }
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
lvim.builtin.lualine.options.component_separators = "|"
