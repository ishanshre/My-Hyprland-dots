return {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = { 'markdown' },
    config = function()
        vim.g.mkdp_auto_start = 1
        vim.g.mkdp_open_to_the_world = 0
        vim.g.mkdp_browser = 'google-chrome' -- Set your browser
    end,
}
