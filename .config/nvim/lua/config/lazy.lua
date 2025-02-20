-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out =
    vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    -- { import = "plugins.alpha" },
    { import = "plugins.whichkey" },
    -- { import = "plugins.telescope" },
    { import = "plugins.nvim_lspconfig" },
    { import = "plugins.snacks" },
    { import = "plugins.confirm" },
    { import = "plugins.nvim_cmp" },
    { import = "plugins.catppuccin" },
    { import = "plugins.comments" },
    { import = "plugins.mini" },
    { import = "plugins.treesetter" },
    -- { import = "plugins.nvimtree" },
    { import = "plugins.debug" },
    { import = "plugins.codium" },
    -- { import = "plugins.line" },
    { import = "plugins.autopairs" },
    { import = "plugins.bufferline" },
    { import = "plugins.lazygit" },
    { import = "plugins.lualine" },
    { import = "plugins.misc" },
    { import = "plugins.venv_selector" },
    -- { import = "plugins.markdown-preview" },
    -- { import = "plugins.notify" },
    { import = "plugins.vim_visual_mini" },
    { import = "plugins.terminal" },
    { import = "plugins.formatter" },
    -- { import = "plugins.smothiee" },
    { import = "plugins.fzf_lua" },
    { import = "plugins.yazi" },
    { import = "plugins.noice" },
    { import = "plugins.gitsigns" },
    { import = "plugins.markdown_render" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
