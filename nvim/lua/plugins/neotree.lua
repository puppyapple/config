return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  opts = {
    enable_diagnostics = false,
    default_component_configs = {
      git_status = {
        symbols = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    window = {
      width = 32,
      mappings = {
        ["l"] = "open_with_window_picker",
      },
    },
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
    },
  },
}
