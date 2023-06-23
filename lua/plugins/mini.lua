return {

	{
		'echasnovski/mini.pairs',
		version = false,
		event = { 'InsertEnter', 'CmdLineEnter' },
		opts = {
			modes = { command = true }
		}
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

}
