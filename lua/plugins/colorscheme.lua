return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        contrast = 'hard',
        italic = {
          strings   = true,
          comments  = true,
          operators = false,
          folds     = true,
        },
      })
      vim.cmd([[colorscheme gruvbox]])
      vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE]])
    end
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE]])
      vim.cmd([[colorscheme tokyonight-night ]])
    end
  }
}
