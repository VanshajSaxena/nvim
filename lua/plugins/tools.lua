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

	--[[
	{
		'ThePrimeagen/harpoon',
		branch       = 'harpoon2',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
		config       = function()
			local harpoon = require('harpoon')
			harpoon:setup({})

			-- basic telescope configuration
			local conf = require('telescope.config').values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require('telescope.pickers').new({}, {
					prompt_title = 'Harpoon',
					finder = require('telescope.finders').new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				}):find()
			end
			vim.keymap.set('n', '<C-e>', function() toggle_telescope(harpoon:list():next()) end,
				{ desc = 'Open harpoon window' })
		end,
		keys         = {
			{ '<leader>hs', function() require('harpoon'):list():display() end },
			{ '<leader>ha', function() require('harpoon'):list():append() end },
			{ '<leader>1',  function() require('harpoon'):list():select(1) end },
			{ '<leader>2',  function() require('harpoon'):list():select(2) end },
			{ '<leader>3',  function() require('harpoon'):list():select(3) end },
			{ '<leader>4',  function() require('harpoon'):list():select(4) end },
			{ '<leader>hh', function() require('harpoon.ui'):toggle_quick_menu(require('harpoon'):list()) end },
			{ '<leader>hk', function() require('harpoon'):list():prev() end },
		}
	},]]


	{
		'glacambre/firenvim', -- Firenvim for browser integration
		lazy = false,
		build = function()
			require('lazy').load({ plugins = 'firenvim', wait = true })
			vim.fn['firenvim#install'](0)
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
			vim.keymap.set('n', '<leader>aw', '<cmd>lua Autowrite_buf_content()<CR>',
				{ desc = 'firenvim AutoWrite to spawned buffer' })
			vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'firenvim write' })
			vim.keymap.set('n', '<esc><esc>', '<cmd>qall!<CR>', { desc = 'firenvim quit all' })
		end
	}

}
