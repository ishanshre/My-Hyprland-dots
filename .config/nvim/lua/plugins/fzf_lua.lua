return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        keys = {
            -- All commands prefixed with <leader>f
            { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find Files" },
            { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live Grep" },
            { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Find Buffers" },
            { "<leader>fh", function() require("fzf-lua").helptags() end, desc = "Help Tags" },
            { "<leader>fp", function() require("fzf-lua").resume() end, desc = "Resume Last Picker" },
            { "<leader>fr", function() require("fzf-lua").registers() end, desc = "Registers" },
            { "<leader>fm", function() require("fzf-lua").marks() end, desc = "Marks" },
            { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Keymaps" },
            { "<leader>fs", function() require("fzf-lua").spell_suggest() end, desc = "Spell Suggestions" },
            { "<leader>f8", function() require("fzf-lua").grep_visual() end, desc = "Grep Visual Selection", mode = "v" },
            { "<leader>f7", function() require("fzf-lua").grep_cword() end, desc = "Grep Current Word" },
            { "<leader>fc", function() require("fzf-lua").git_bcommits() end, desc = "Git File Commits" },
            { "<leader>fs", function() require("fzf-lua").git_status() end, desc = "Git Status" },
            { "<leader>fd", function() require("fzf-lua").lsp_definitions() end, desc = "LSP Definitions" },
        },
    },
}



