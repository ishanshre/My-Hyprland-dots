return {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            term_colors = true,
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = { "italic", "bold" },
                keywords = {},
                strings = {},
                variables = { "italic" },
                numbers = {},
                booleans = { "italic" },
                properties = {},
                types = {},
                operators = { "italic" },
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            highlight_overrides = {
              all = function(colors)
                return {
                  FloatBorder = { link = "SagaBorder" },
                  CurSearch = { bg = colors.sky },
                  IncSearch = { bg = colors.sky },
                  CursorLineNr = { fg = colors.blue, style = { "bold" } },
                  DashboardFooter = { fg = colors.overlay0 },
                  TreesitterContextBottom = { style = {} },
                  WinSeparator = { fg = colors.overlay0, style = { "bold" } },
                  ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
                  ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
                  Headline = { style = { "bold" } },
                  Headline1 = { fg = colors.blue, style = { "bold" } },
                  Headline2 = { fg = colors.pink, style = { "bold" } },
                  Headline3 = { fg = colors.lavender, style = { "bold" } },
                  Headline4 = { fg = colors.green, style = { "bold" } },
                  Headline5 = { fg = colors.peach, style = { "bold" } },
                  Headline6 = { fg = colors.flamingo, style = { "bold" } },
                  rainbow1 = { fg = colors.blue, style = { "bold" } },
                  rainbow2 = { fg = colors.pink, style = { "bold" } },
                  rainbow3 = { fg = colors.lavender, style = { "bold" } },
                  rainbow4 = { fg = colors.green, style = { "bold" } },
                  rainbow5 = { fg = colors.peach, style = { "bold" } },
                  rainbow6 = { fg = colors.flamingo, style = { "bold" } },
                }
              end,
            },
            color_overrides = {
              all = {
                rosewater = "#f5e0dc",
                flamingo = "#f2cdcd",
                pink = "#f5c2e7",
                mauve = "#cba6f7",
                red = "#f38ba8",
                maroon = "#eba0ac",
                peach = "#fab387",
                yellow = "#f9e2af",
                green = "#a6e3a1",
                teal = "#94e2d5",
                sky = "#89dceb",
                sapphire = "#74c7ec",
                blue = "#89b4fa",
                lavender = "#b4befe",
                text = "#cdd6f4",
                subtext1 = "#bac2de",
                subtext0 = "#a6adc8",
                overlay2 = "#9399b2",
                overlay1 = "#7f849c",
                overlay0 = "#717171",
                surface2 = "#585b70",
                surface1 = "#45475a",
                surface0 = "#313244",
                base = "#000000",
                -- mantle = "#181825",
                -- crust = "#11111b",
                mantle = "#000000",
                crust = "#1c1c1a",
                border = "#ffffff"
              },
            },        
            integrations = {
                cmp = true,
                gitsigns = true,
                neotree = true,
                treesitter = true,
                notify = false,
                dashboard = true,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            }
        })
        
        -- Set the colorscheme
        vim.cmd.colorscheme 'catppuccin'

        -- You can configure highlights by doing something like:
        vim.cmd('highlight Comment gui=NONE')
    end,
}


