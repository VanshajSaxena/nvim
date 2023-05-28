return{
	{
			'ellisonleao/gruvbox.nvim',		
			lazy = false,
			priority = 1000,
			opts = function()
				vim.cmd([[colorscheme gruvbox]])
			end
	},
}
