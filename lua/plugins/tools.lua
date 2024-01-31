return {

	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		opts = {
			panel = {
				auto_refresh = true
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = '<M-;>'
				}
			}
		}
	},

	{
		'christoomey/vim-tmux-navigator',
		keys = {
			{ '<c-h>', desc = 'move left' },
			{ '<c-j>', desc = 'move down' },
			{ '<c-k>', desc = 'move up' },
			{ '<c-l>', desc = 'move right' },
		}
	},

	{
		'glacambre/firenvim', -- Firenvim for browser integration
		lazy = not vim.g.started_by_firenvim,
		build = function()
			require('lazy').load({ plugins = { 'firenvim' }, wait = true })
			vim.fn['firenvim#install'](0)
		end,
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
			local function autowrite_buf_content()
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

			vim.api.nvim_create_autocmd({ 'BufReadPre' }, {
				callback = function()
					vim.opt.laststatus = 1
				end
			})

			--Keymap for Autowrite_buf_content
			vim.keymap.set('n', '<leader>aw', autowrite_buf_content, { desc = 'firenvim AutoWrite to spawned buffer' })
			vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'firenvim write' })
			vim.keymap.set('n', '<esc><esc>', '<cmd>qall!<CR>', { desc = 'firenvim quit all' })
		end
	}

}
