return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- Open yazi at the current file
      {
        "<leader>-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      -- Open in the current working directory
      {
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      -- Toggle yazi session with backslash
      {
        "\\",
        "<cmd>Yazi toggle<cr>",
        desc = "Toggle yazi open and close",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
}

