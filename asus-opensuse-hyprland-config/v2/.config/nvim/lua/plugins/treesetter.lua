return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'python', 'rust', 'go', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'xml' },
      auto_install = true,
      highlight = {
        enable = true,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
    },
  }
}
