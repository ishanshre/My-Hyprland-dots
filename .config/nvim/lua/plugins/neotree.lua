return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
        filesystem = {
            follow_current_file = true,
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                },
            },
            filtered_items = {
                visible = true, -- Show hidden files
            },
        },
        default_component_configs = {
            name = {
                highlight_opened_files = true, -- Highlight files already opened in buffers
            },
        },
    },
}
