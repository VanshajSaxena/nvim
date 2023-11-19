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
		enabled = function()
			if os.getenv('OS') == 'Windows_NT' then
				return true
			else
				return false
			end
		end,
		build = ':Neorg sync-parsers',
		cmd = 'Neorg',
		ft = 'norg',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('neorg').setup {
				load = {
					['core.defaults'] = {}, -- Loads default behaviour
					['core.concealer'] = {}, -- Adds pretty icons to your documents
					['core.dirman'] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = '~/.var/neorg/notes',
							},
						},
					},
				},
			}
		end,
	}
}
