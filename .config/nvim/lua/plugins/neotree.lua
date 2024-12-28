return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- Recommended for icons
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    default_component_configs = {
      name = {
        highlight_opened_files = true, -- Highlight files already opened in buffers
      },
      modified = {
        symbol = "[+]", -- Symbol for modified files
        highlight = "NeoTreeModified",
      },
    },
    window = {
      border = "solid", -- Solid border for NeoTree window
      border_color = "#ffffff", -- Set white border color
    },
  },
}

