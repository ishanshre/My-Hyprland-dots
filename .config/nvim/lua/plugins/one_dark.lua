return {
    { -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
        'olimorris/onedarkpro.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        lazy = false,
        init = function()
            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            vim.cmd.colorscheme 'onedark_dark'

            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
            require('onedarkpro').setup({
                -- theme = 'onedark_dark',     -- Use 'onedark', 'onelight', or 'onedark_vivid'
                options = {
                    bold = true,            -- Use bold keywords
                    italic = true,          -- Disable italics for comments
                    underline = true,       -- Disable underlined text
                    transparency = true,    -- Keep the background opaque
                    terminal_colors = true, -- Use theme colors in the terminal
                    cursorline = true,
                    highlight_inactive_windows = true,
                },
                styles = {
                    strings = "bold",          -- Make strings bold
                    keywords = "bold",         -- Make keywords bold
                    functions = "italic,bold", -- Italicize and bold functions
                    conditionals = "italic",
                },
                highlights = {
                    FloatBorder = { fg = "#5c6370", bg = "#abb2bf" },
                    NormalFloat = { bg = "#1e222a" },           -- Slightly darker floating background
                    Pmenu = { bg = "#282c34", fg = "#abb2bf" }, -- Popup menu background
                    PmenuSel = { bg = "#3e4451" },              -- Highlighted menu item
                    CursorLine = { bg = "#2c313c" },            -- Highlighted line
                    Visual = { bg = "#3e4451" },                -- Visual selection
                    Comment = { italic = true },
                    ErrorMsg = { italic = true, bold = true },
                },
            })
        end,
    }
}
