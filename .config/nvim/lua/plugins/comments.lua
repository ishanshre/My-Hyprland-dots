return {
  'numToStr/Comment.nvim',
  event = 'BufReadPost',
  config = function()
    require('Comment').setup {
      pre_hook = function(ctx)
        -- Adjust comments for filetypes (example: treesitter context for Rust)
        if vim.bo.filetype == 'rust' then
          return require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()(ctx)
        end
      end,
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-_>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('n', '<C-c>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('n', '<C-/>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('v', '<C-_>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    vim.keymap.set('v', '<C-c>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    vim.keymap.set('v', '<C-/>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)

    -- Block comment toggling
    vim.keymap.set('n', '<C-B>', require('Comment.api').toggle.blockwise.current, opts)
    vim.keymap.set('v', '<C-B>', "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>", opts)
  end,
}

