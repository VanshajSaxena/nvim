return {

	{
		'ellisonleao/gruvbox.nvim',
		enabled = true,
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
			vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
			vim.cmd([[hi @keyword cterm=italic gui=italic guifg=#fb4934]])
			vim.cmd([[hi link @keyword.return.lua @keyword ]])
		end
	},

	{
		'folke/tokyonight.nvim',
		enabled = true,
		lazy = true,
		--priority = 1000,
		config = function()
			--vim.cmd([[colorscheme tokyonight-night ]])
			vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE]])
		end
	}

}
