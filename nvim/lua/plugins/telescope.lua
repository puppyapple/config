local Util = require("lazyvim.util")
local actions = require("telescope.actions")
local send_selected_to_qflist_and_open = function(...)
  actions.send_selected_to_qflist(...)
  require("trouble").toggle("quickfix")
end
local send_all_to_qflist_and_open = function(...)
  actions.send_to_qflist(...)
  require("trouble").toggle("quickfix")
end

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>ft", false },
    { "<leader>fT", false },
    { "<leader>ff", false },
    { "<leader>fF", false },
    { "<leader>fb", false },
    { "<leader>/", false },
    { "<leader>st", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    { "<leader>ba", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>sf", Util.telescope("files"), desc = "Find Files (root dir)" },
    { "<leader>sF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>sR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-q>"] = send_selected_to_qflist_and_open,
          ["<A-q>"] = send_all_to_qflist_and_open,
        },
        n = {
          ["<C-q>"] = send_selected_to_qflist_and_open,
          ["<A-q>"] = send_all_to_qflist_and_open,
        },
      },
    },
    pickers = {
      buffers = {
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
    },
  },
}
