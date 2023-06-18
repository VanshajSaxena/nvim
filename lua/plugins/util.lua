return {

	-- library used by other plugins
	{ 'nvim-lua/plenary.nvim', lazy = true },

	-- makes plugins dot-repeatable eg. leap
	{
		'tpope/vim-repeat',
		lazy = true,
		event = 'InsertEnter'
	},

}
