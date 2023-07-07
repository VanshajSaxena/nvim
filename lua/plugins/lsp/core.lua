return {

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'folke/neodev.nvim', opts = {} },
			'mason.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			{
				'williamboman/mason-lspconfig.nvim', -- Works as expected
				opts = {
					ensure_installed = { 'jdtls' },
					automatic_installation = { 'lua-language-server' }
					--vim.diagnostic.config()
				},
			},
			{
				'hrsh7th/cmp-nvim-lsp',
				event = 'LspAttach'
			}
		},
	},

	{
		'williamboman/mason.nvim', -- Works as expected
		cmd = 'Mason',
		build = ':MasonUpdate',
		opts = {
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗'
				}
			},
		},
		config = true
	},

	{
		'mfussenegger/nvim-jdtls', -- Java Language Server
		lazy = true
	},

}
