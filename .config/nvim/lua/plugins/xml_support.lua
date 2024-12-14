-- File: ~/.config/nvim/lua/plugins.lua (or wherever your Lazy config is)
return {
    -- Emmet for autocompletion
    {
        'mattn/emmet-vim',
        ft = { 'html', 'xml' }, -- Enable Emmet for XML
    },

    -- Optional: XML formatter
    {
        'prettier/vim-prettier',
        run = 'yarn install --frozen-lockfile --production',
        ft = { 'xml' },
    }
}
