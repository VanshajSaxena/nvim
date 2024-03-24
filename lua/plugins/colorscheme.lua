return {

	{
		'ellisonleao/gruvbox.nvim',
		enabled = false,
		lazy = true,
		priority = 1000,
		config = function()
			require('gruvbox').setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = 'hard', -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})
			vim.cmd([[ colorscheme ron ]])
			vim.cmd([[ hi @keyword cterm=italic gui=italic guifg=#fb4934 ]])
			vim.cmd([[ hi link SagaNormal Normal ]])
			vim.cmd([[ hi link LazyNormal Normal ]])
			vim.cmd([[ hi link @keyword.return.lua @keyword ]])
		end
	},

	{
		'xiyaowong/transparent.nvim',
		lazy = false,
	},

	{
		'folke/tokyonight.nvim',
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night ]])
		end
	}

}
