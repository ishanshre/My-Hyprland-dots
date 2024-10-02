require("options")
require("keymaps")
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    require 'plugins.alpha',
    require 'plugins.gitsigns',
    require 'plugins.whichkey',
    require 'plugins.telescope',
    require 'plugins.lazydev',
    require 'plugins.luvit_meta',
    require 'plugins.nvim_lspconfig',
    require 'plugins.confirm',
    require 'plugins.nvim_cmp',
    require 'plugins.catppuccin',
    require 'plugins.comments',
    require 'plugins.mini',
    require 'plugins.treesetter',
    require 'plugins.neotree',
    require 'plugins.debug',
    require 'plugins.lint',
    require 'plugins.line',
    require 'plugins.autopairs',
    -- require 'plugins.avante',
    require 'plugins.bufferline',
    require 'plugins.lazygit',
    require 'plugins.lualine',
    require 'plugins.misc',
    require 'plugins.none-ls',
    require 'plugins.venv_selector',
    --  require 'plugins.',
}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})
