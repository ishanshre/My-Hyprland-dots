return {
    {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add          = { text = "▎" },
                change       = { text = "▎" },
                delete       = { text = "▁" },
                topdelete    = { text = "▔" },
                changedelete = { text = "▎" },
                untracked    = { text = "▎" },
            },
            signcolumn = true, -- Show signs in the number column
            numhl = false, -- Highlight numbers on affected lines
            linehl = false, -- Highlight the entire line on affected lines
            word_diff = false, -- Show word-level diffs inline
            current_line_blame = true, -- Show blame info for the current line
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 500,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6, -- Priority of the sign column highlights
            update_debounce = 200, -- Debounce time for updates
            max_file_length = 40000, -- Disable if file size exceeds this limit
            preview_config = { -- Options for previewing diffs
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            -- yadm = { enable = false }, -- Enable support for yadm
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then return "]c" end
                    vim.schedule(function() gs.next_hunk() end)
                    return "<Ignore>"
                end, { expr = true })

                map("n", "[c", function()
                    if vim.wo.diff then return "[c" end
                    vim.schedule(function() gs.prev_hunk() end)
                    return "<Ignore>"
                end, { expr = true })

                -- Actions
                map("n", "<leader>hs", gs.stage_hunk)
                map("n", "<leader>hr", gs.reset_hunk)
                map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)
                map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)
                map("n", "<leader>hS", gs.stage_buffer)
                map("n", "<leader>hu", gs.undo_stage_hunk)
                map("n", "<leader>hR", gs.reset_buffer)
                map("n", "<leader>hp", gs.preview_hunk)
                map("n", "<leader>hb", function() gs.blame_line { full = true } end)
                map("n", "<leader>tb", gs.toggle_current_line_blame)
                map("n", "<leader>hd", gs.diffthis)
                map("n", "<leader>hD", function() gs.diffthis("~") end)
                map("n", "<leader>td", gs.toggle_deleted)

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}

}
