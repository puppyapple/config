local actions = require("telescope.actions")
return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>ft", false },
    { "<leader>fT", false },
    { "<leader>ff", false },
    { "<leader>fF", false },
    { "<leader>fb", false },
    { "<leader>/", false },
    { "<leader>ba", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>st", LazyVim.pick("live_grep"), desc = "Grep (root dir)" },
    { "<leader>ba", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>sf", LazyVim.pick("auto"), desc = "Find Files (root dir)" },
    { "<leader>sF", LazyVim.pick("auto", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>sR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
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
