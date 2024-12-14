return {
    'hkupty/iron.nvim',
    dependencies = {},
    cmd = 'IronRepl',
    keys = {
        { '<space>rs', '<cmd>IronRepl<CR>',    desc = 'Open Iron REPL',     silent = true },
        { '<space>rr', '<cmd>IronRestart<CR>', desc = 'Restart Iron REPL',  silent = true },
        { '<space>rf', '<cmd>IronFocus<CR>',   desc = 'Focus on Iron REPL', silent = true },
        { '<space>rh', '<cmd>IronHide<CR>',    desc = 'Hide Iron REPL',     silent = true },
    },
    opts = function()
        local iron = require("iron.core")
        local view = require("iron.view")

        iron.setup {
            config = {
                scratch_repl = true,
                repl_definition = {
                    sh = {
                        command = { "zsh" }
                    },
                    python = {
                        command = { "python3" },
                        format = require("iron.fts.common").bracketed_paste_python
                    },
                    haskell = {
                        command = function(meta)
                            local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
                            return { 'cabal', 'v2-repl', filename }
                        end
                    }
                },
                repl_open_cmd = view.split.vertical.botright(40), -- Open REPL in a vertical split
            },
            keymaps = {
                send_motion = "<space>sc",
                visual_send = "<space>sc",
                send_file = "<space>sf",
                send_line = "<space>sl",
                send_paragraph = "<space>sp",
                send_until_cursor = "<space>su",
                send_mark = "<space>sm",
                mark_motion = "<space>mc",
                mark_visual = "<space>mc",
                remove_mark = "<space>md",
                cr = "<space>s<cr>",
                interrupt = "<space>s<space>",
                exit = "<space>sq",
                clear = "<space>cl",
            },
            highlight = {
                italic = true
            },
            ignore_blank_lines = true, -- Ignore blank lines when sending visual select lines
        }

        return iron
    end,
}
