local Util = require("lazyvim.util")
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
    { "<leader>/",  false },
    { "<leader>st", Util.telescope("live_grep"),                          desc = "Grep (root dir)" },
    { "<leader>ba", "<cmd>Telescope buffers<cr>",                         desc = "Buffers" },
    { "<leader>sf", Util.telescope("files"),                              desc = "Find Files (root dir)" },
    { "<leader>sF", Util.telescope("files", { cwd = false }),             desc = "Find Files (cwd)" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>",                        desc = "Recent" },
    { "<leader>sR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
  },
}
