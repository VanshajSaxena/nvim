return {

	{
		'christoomey/vim-tmux-navigator',
		keys = {
			{ '<c-h>', desc = 'Move left' },
			{ '<c-j>', desc = 'Move down' },
			{ '<c-k>', desc = 'Move up' },
			{ '<c-l>', desc = 'Move right' },
		}
	},

	{
		'glacambre/firenvim', -- Firenvim for browser integration
		lazy = false,
		build = function()
			if os.getenv('OS') == 'Windows_NT' then
			require('lazy').load({ plugins = 'firenvim', wait = true })
			vim.fn['firenvim#install'](0)
			end
		end,
		cond = not not vim.g.started_by_firenvim,
		config = function()
			vim.g.firenvim_config = {
				globalSettings = {
					alt = 'all',
					cmdlineTimeout = 2001,
					ignoreKeys = {
						all = { '<C-->' },
						normal = { '<C-1>', '<C-2>', '<C-3>', '<C-4>', '<C-5>', '<C-6>', '<C-7>',
							'<F11>',
							'<F5>'
						}
					}
				},
				localSettings = {
					['.*'] = {
						cmdline  = 'firenvim',
						content  = 'text',
						priority = 0,
						selector = 'textarea',
						takeover = 'never'
					},
					['google.*'] = {
						takeover = 'never'
					}
				}
			}
			-- AutoWrite Function
			function Autowrite_buf_content()
				vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
					callback = function()
						if vim.g.timer_started == true then
							return
						end
						vim.g.timer_started = true
						vim.fn.timer_start(10000, function()
							vim.g.timer_started = false
							vim.cmd('write')
						end)
					end
				})
				print('AutoWrite buff content started...')
				-- code
			end

			--Keymap for Autowrite_buf_content
			vim.api.nvim_set_keymap('n', '<leader>aw', '<cmd>lua Autowrite_buf_content()<CR>',
				{ noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>w<CR>', {})
			vim.api.nvim_set_keymap('n', '<esc><esc>', '<cmd>qall!<CR>', {})
		end
	}

}
