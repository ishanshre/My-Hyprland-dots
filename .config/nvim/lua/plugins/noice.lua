return {

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- Configure LSP message overrides
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom command-line search
          command_palette = true, -- position the command palette at the top
          long_message_to_split = true, -- long messages go to a split
          inc_rename = false, -- enable for `inc-rename.nvim`
          lsp_doc_border = true, -- add borders to LSP hover/doc
        },
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
            border = {
              style = "rounded",
              padding = { 1, 2 },
            },
            win_options = {
              winblend = 0,
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        },
        notify = {
          -- Noice can be used as `vim.notify` so you can route any notification like other messages
          -- Notification messages have their level and other properties set.
          -- event is always "notify" and kind can be any log level as a string
          -- The default routes will forward notifications to nvim-notify
          -- Benefit of using Noice for this is the routing and consistent history view
          enabled = false,
          view = "notify",
        },
        messages = {
          enabled = false, -- enable message rendering
          view = "mini", -- default message view
        },
        commands = {
          history = {
            enabled = true, -- enable command history
            view = "popup",
          },
        },
      }
    end,
  },
}
