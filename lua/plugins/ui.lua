return {
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		opts = function()
			return {
				options = {
					theme = 'auto',
					globalstatus = true,
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch' },
					lualine_c = {
						{ 'filename' },
						{
							'diagnostics',
							-- Table of diagnostic sources, available sources are:
							--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
							-- or a function that returns a table as such:
							--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
							sources = { 'nvim_lsp' },

							-- Displays diagnostics for the defined severity types
							sections = { 'error', 'warn', 'info' },

							symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
							colored = true, -- Displays diagnostics status in color if set to true.
							update_in_insert = false, -- Update diagnostics in insert mode.
							always_visible = false, -- Show diagnostics even if there are none.
						},
					},
					lualine_x = {
						-- stylua: ignore
						{
							function() return '  ' .. require('dap').status() end,
							cond = function() return package.loaded['dap'] and require('dap').status() ~= '' end,
						},
						{ require('lazy.status').updates, cond = require('lazy.status').has_updates },
						{ 'filetype' }
					},
				},
				extensions = { 'lazy' },
			}
		end,
	},

	{ 'nvim-tree/nvim-web-devicons', lazy = true },

	{
		'akinsho/bufferline.nvim',
		version = '*',
		event = 'BufReadPost',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			local bufferline = require('bufferline')
			bufferline.setup({
				options = {
					--numbers = function(opts)
					--return string.format('%s·%s', opts.ordinal, opts.lower(opts.id))
					--end,
					--style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
					diagnostics = 'nvim_lsp',
					offsets = {
						{
							filetype = 'NvimTree',
							highlight = 'SpecialKey',
							text = 'FileExplorer',
						}
					},
					always_show_bufferline = false,
					separator_style = 'thick' --thick,slope looks good
				},

			})
		end
	},

	{
		'j-hui/fidget.nvim',
		tag = 'legacy',
		event = 'LspAttach',
		opts = {
				text = {
					spinner = 'dots',
					done = '',
					commenced = 'Initializing',
					completed = 'Done'
				},
				window = {
					blend = 00,
					relative = 'editor'
				},
				fmt = {
					leftpad = false,
					max_width = 45,
					stack_upwards = false
				}
			},
	}
}
