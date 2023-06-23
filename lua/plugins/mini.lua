return {

	{
		'echasnovski/mini.pairs',
		version = false,
		event = { 'InsertEnter', 'CmdLineEnter' },
		opts = {
			modes = { command = true }
		},
	},

	{
		'echasnovski/mini.ai', -- a,i textobjects
		version = false,
		event = 'VeryLazy',
		opts = {
			-- Number of lines within which textobject is searched
			n_lines = 500
		},
	},

	{
		'echasnovski/mini.surround',
		version = false,
		--event = 'VeryLazy',
		keys = {
			{ 'gza' },
			{ 'gzd' },
			{ 'gzf' },
			{ 'gzF' },
			{ 'gzh' },
			{ 'gzr' },
			{ 'gzn' },
		},
		opts = {
			mappings = {
				add = 'gza', -- Add surrounding in Normal and Visual modes
				delete = 'gzd', -- Delete surrounding
				find = 'gzf', -- Find surrounding (to the right)
				find_left = 'gzF', -- Find surrounding (to the left)
				highlight = 'gzh', -- Highlight surrounding
				replace = 'gzr', -- Replace surrounding
				update_n_lines = 'gzn', -- Update `n_lines`
			},

			search_method = 'cover_or_next',

			-- Number of lines within which surrounding is searched
			n_lines = 500
		},
	},

}
