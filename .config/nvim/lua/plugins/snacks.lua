-- return {
--   {
--     "folke/snacks.nvim",
--     priority = 1000,
--     lazy = false,
--     opts = {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--       bigfile = { enabled = true },
--       dashboard = {
--         enabled = true,
--         sections = {
--           { section = "header" },
--           { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
--           {
--             icon = " ",
--             title = "Recent Files",
--             section = "recent_files",
--             indent = 2,
--             padding = 1,
--           },
--           { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
--           { section = "startup" },
--         },
--       },
--       dim = { enabled = true },
--       indent = { enabled = true },
--       input = { enabled = true },
--       -- notifier = { enabled = true },
--       -- quickfile = { enabled = true },
--       -- scroll = { enabled = true },
--       -- statuscolumn = { enabled = true },
--       -- words = { enabled = true },
--     },
--   },
-- }

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        {
          icon = " ",
          title = "Recent Files",
          section = "recent_files",
          indent = 2,
          padding = 1,
        },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    indent = { enabled = true },
    -- input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
}
