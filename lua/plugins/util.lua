return {

	-- library used by other plugins
	{ 'nvim-lua/plenary.nvim', lazy = true },

	-- makes plugins dot-repeatable eg. leap
	{
		'tpope/vim-repeat',
		lazy = true,
		event = 'InsertEnter'
	},

	{
		'nvim-neorg/neorg',
		build = ':Neorg sync-parsers',
		ft = 'neorg',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('neorg').setup {
				load = {
					['core.defaults'] = {}, -- Loads default behaviour
					['core.concealer'] = {}, -- Adds pretty icons to your documents
					['core.dirman'] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = '~/notes',
							},
						},
					},
				},
			}
		end,
	}
}
