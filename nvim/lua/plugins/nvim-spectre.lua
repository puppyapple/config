return {
  "nvim-pack/nvim-spectre",
  keys = {
    { "<leader>sr", false },
    {
      "<leader>fR",
      function()
        require("spectre").open()
      end,
      desc = "Replace in files (Spectre)",
    },
  },
}
