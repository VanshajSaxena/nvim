return {
	'nvimdev/lspsaga.nvim',
	event = 'LspAttach',

	opts = {
		hover_doc = {
			max_preview_lines = 10,
			keys = {
				quit = { 'q', '<Esc>' }
			}
		},
		rename = {
			quit = '<Esc>',
			--		exec = "<CR>",
			--		mark = "x",
			--		confirm = "<CR>",
			--		in_selejt = true,
		},
		symbol_in_winbar = {
			enable = true,
			--		separator = " ",
			--		hide_keyword = true,
			--		show_file = true,
			--		folder_level = 2,
			respect_root = false,
			color_mode = true
		},
		ui = {
			code_action = '󰌶 ',
			winblend = 0,
			max_preview_lines = 10,
			border = 'rounded',
		}
	},

	keys = {
		{ 'gh',         '<cmd>Lspsaga lsp_finder<cr>' },
		{ '<leader>gr', '<cmd>Lsapsaga rename<cr>' },
		{ '<leader>gR', '<cmd>Lspsaga rename ++project<cr>' },
		{ 'gd',         '<cmd>Lspsaga goto_definition<cr>' },
		{ 'gd',         '<cmd>Lspsaga peek_definition<cr>' },
		{ 'sl',         '<cmd>Lspsaga show_line_diagnostics<cr>' },
		{ 'sc',         '<cmd>Lspsaga show_cursor_diagnostics<cr>' },
		{ 'sb',         '<cmd>Lspsaga show_buf_diagnostics<cr>' },
		{ '[e',         '<cmd>Lspsaga diagnostic_jump_prev<cr>' },
		{ ']e',         '<cmd>Lspsaga diagnostic_jump_next<cr>' },
		{ 'K',          '<cmd>Lspsaga hover_doc ++quiet<cr>' },
		{ '<leader>o',  '<cmd>Lspsaga outline<cr>' },
		{ '<leader>ci', '<cmd>Lspsaga incoming_calls<cr>' },
		{ '<leader>co', '<cmd>Lspsaga outgoing_calls<cr>' },
		{ '<leader>tr', '<cmd>Lspsaga term_toggle<cr>' },
		{ '[E', function()
			require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end },
		{ 'E]', function()
			require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end },
	}

}
