return {

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'folke/neodev.nvim', opts = {} },
			'mason.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			'lukas-reineke/indent-blankline.nvim',
			{
				'williamboman/mason-lspconfig.nvim', -- Works as expected
				opts = {
					--list of servers that are automatically installed regardless of lspconfig setup
					ensure_installed = { 'lua_ls', 'jdtls' },
					--list of servers that will automatically install when setup with lspconfig
					automatic_installation = true
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
				local server = require('lspconfig')
				-- lua_ls server configuration
				server.lua_ls.setup {
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
							hint = {
								enable = true,
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

				-- swift language server
				server.sourcekit.setup {
					cmd = { 'sourcekit-lsp' },
				}

				-- nix language server
				require'lspconfig'.nil_ls.setup{}

				-- clangd server configuration
				server.clangd.setup {
					cmd = { 'clangd' },
					root_dir = require('lspconfig').util.find_git_ancestor,
					capabilities = capabilities,
					on_attach = function()
					end,
					single_file_support = true
				}

				--[[ jedi language server: less completion result and stuck at references
				server.jedi_language_server.setup({
				capabilities = capabilities,
				})
				]]

				-- pyright language server for python
				server.pyright.setup({
					settings = {
						python = {
							analysis = {
								diagnosticMode = 'off',
								typeCheckingMode = 'off'
							}
						}
					}
				})

				-- html language server
				local capabilities_html = vim.lsp.protocol.make_client_capabilities()
				capabilities_html.textDocument.completion.completionItem.snippetSupport = true
				-- requres npm i vscode-langservers-extracted in the project root of the server plugin
				server.html.setup {
					capabilities = capabilities_html
				}

				-- ruff lsp and linter for python
				server.ruff_lsp.setup {
					---@diagnostic disable-next-line: unused-local
					on_attach = function(client, bufnr)
						client.server_capabilities.hoverProvider = false
					end
				}

				-- bash language server
				server.bashls.setup {
					root_dir = server.util.root_pattern(),
					settings = {
						bashIde = {
							enableSourceErrorDiagnostics = true
						}
					}
				}

				-- Diagnostic symbols in the sign column (gutter)
				local
				signs = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' }
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
					update_in_insert = false,
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
