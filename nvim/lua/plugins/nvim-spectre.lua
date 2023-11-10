return {
  "nvim-pack/nvim-spectre",
  keys = {
    { "<leader>sr", false },
    {
      "<leader>fR",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Replace in files (Spectre)",
    },
  },
}
