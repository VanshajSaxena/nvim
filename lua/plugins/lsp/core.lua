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
		config =
			function()
				local capabilities = require('cmp_nvim_lsp').default_capabilities()
				require('lspconfig')['lua_ls'].setup {
					capabilities = capabilities,
					on_attach = function()
					end,
					settings = {
						Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
								version = 'LuaJIT',
							},
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { 'vim' },
							},
							workspace = {
								-- Make the server aware of Neovim runtime files
								library = vim.api.nvim_get_runtime_file('', true),
								checkThirdParty = false
							},
							-- Do not send telemetry data containing a randomized but unique identifier
							telemetry = {
								enable = false,
							},
						},
					},
				}
				-- Diagnostic symbols in the sign column (gutter)
				local
				signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
				for type, icon in pairs(signs) do
					local
					hl = 'DiagnosticSign' .. type
					vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
				end
				-- vim diagnostics config for displaying error and warn
				vim.diagnostic.config({
					virtual_text = {
						prefix = '●',
						source = 'always'
					},
					float = {
						source = 'always'
					},
					signs = true,
					underline = true,
					update_in_insert = true,
					severity_sort = true,
				})
			end,
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
