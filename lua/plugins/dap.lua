return {
	'mfussenegger/nvim-dap',

	dependencies = {
		{
			'rcarriga/nvim-dap-ui',
			-- stylua: ignore
			keys = {
				{ '<leader>du', function() require('dapui').toggle({ reset = true }) end, desc = 'dap ui' },
				{
					'<F29>', -- Ctrl + F5
					function() require('dapui').eval() end,
					desc = 'dap eval (Ctrl + F5)',
					mode = { 'n', 'v' }
				},
				{
					'<leader>de',
					function() require('dapui').eval() end,
					desc = 'dap eval',
					mode = { 'n', 'v' }
				},
			},
			opts = {},
			config = function(_, opts)
				local dap = require('dap')
				local dapui = require('dapui')
				dapui.setup(opts)
				dap.listeners.after.event_initialized['dapui_config'] = function()
					dapui.open({})
				end
				dap.listeners.before.event_terminated['dapui_config'] = function()
					--dapui.close({})
				end
				dap.listeners.before.event_exited['dapui_config'] = function()
					--dapui.close({})
				end
			end,
		},

		{
			'theHamsta/nvim-dap-virtual-text',
			opts = {},
		},

		{
			'jay-babu/mason-nvim-dap.nvim',
			dependencies = 'mason.nvim', -- needs to load mason-nvim-dap after mason -- a test if it works, theres a lag when loading mason through dependency
			cmd = { 'DapInstall', 'DapUninstall' },
			opts = {
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- You'll need to check that you have the required things installed
				-- online, please don't ask me how to install them :)
				ensure_installed = {
					-- Update this to ensure that you have the debuggers for the langs you want
					'javatest'
				},
			},
		},
	},

	keys = {
		{
			'<F33>', -- Ctrl + F9
			function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
			desc =
			'dap breakpoint condition (Ctrl + F9)'
		},
		{
			'<leader>dB', -- Ctrl + F8
			function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
			desc =
			'dap breakpoint condition'
		},
		{
			'<F9>',
			function() require('dap').toggle_breakpoint() end,
			desc =
			'dap toggle breakpoint'
		},
		{
			'<leader>db',
			function() require('dap').toggle_breakpoint() end,
			desc =
			'dap toggle breakpoint'
		},
		{
			'<F5>',
			function() require('dap').continue() end,
			desc =
			'dap continue'
		},
		{
			'<leader>dc',
			function() require('dap').continue() end,
			desc =
			'dap continue'
		},
		{
			'<F53>', -- Alt + F5
			function() require('dap').run_to_cursor() end,
			desc =
			'dap run to cursor (Alt + F5)'
		},
		{
			'<leader>dg',
			function() require('dap').goto_() end,
			desc =
			'dap go to line (no execute)'
		},
		{
			'<F11>',
			function() require('dap').step_into() end,
			desc =
			'dap step into'
		},
		{
			'<leader>dj',
			function() require('dap').down() end,
			desc =
			'dap down'
		},
		{ '<leader>dk', function() require('dap').up() end, desc = 'dap up' },
		{
			'<leader>dl',
			function() require('dap').run_last() end,
			desc =
			'dap run last'
		},
		{
			'<F23>', -- Shift + F7
			function() require('dap').step_out() end,
			desc =
			'dap step out (Shift + F11)'
		},
		{
			'<F10>',
			function() require('dap').step_over() end,
			desc =
			'dap step over'
		},
		{
			'<leader>dp',
			function() require('dap').pause() end,
			desc =
			'dap pause'
		},
		{
			'<leader>dr',
			function() require('dap').repl.toggle() end,
			desc =
			'dap toggle repl'
		},
		{
			'<leader>ds',
			function() require('dap').session() end,
			desc =
			'dap session'
		},
		{
			'<F17>',
			function() require('dap').terminate() end,
			desc =
			'dap terminate (Shift + F5)'
		},
		{
			'<leader>dt',
			function() require('dap').terminate() end,
			desc =
			'dap terminate'
		},
		{
			'<leader>dw',
			function() require('dap.ui.widgets').hover() end,
			desc =
			'dap widgets'
		},
	},
}
