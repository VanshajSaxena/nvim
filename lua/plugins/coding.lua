return {

	{
		'L3MON4D3/LuaSnip',
		event = 'InsertEnter',
		version = '1.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		dependencies = {
			'rafamadriz/friendly-snippets',
			config = function()
				require('luasnip.loaders.from_vscode').lazy_load()
			end,
		},
		-- install jsregexp (optional!).
		build = 'make install_jsregexp'
	},

	{
		'hrsh7th/nvim-cmp',
		version = false, -- last release is way too old
		event = 'InsertEnter',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',       --Works
			'hrsh7th/cmp-buffer',         --Works
			'hrsh7th/cmp-path',           --Works
			'hrsh7th/cmp-calc',           --Works
			'hrsh7th/cmp-cmdline',        --Cmdline Completion
			'saadparwaiz1/cmp_luasnip',   -- Works
			'onsails/lspkind.nvim',       -- vs_code like pictograms for nvim-cmp
			'hrsh7th/cmp-nvim-lsp-signature-help', -- Works after completing paran opening, inside paran
		},

		opts = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			return {
					completion = {
						completeopt = 'menu,menuone,noinsert'
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					snippet = {
						expand = function(args)
							require('luasnip').lsp_expand(args.body)
						end,
					},
					formatting = {
						format = require('lspkind').cmp_format({
							mode = 'symbol_text', -- show only symbol annotations -- opts: text, text_symbol, symbol_text, symbol
							maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
							ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

							-- The function below will be called before any actual modifications from lspkind
							-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
							menu = ({
								buffer = '[Buffer]',
								nvim_lsp = '[LSP]',
								luasnip = '[Luasnip]',
							}),
							before = function(entry, vim_item)
								return vim_item
							end
						})
					},
					mapping = cmp.mapping.preset.insert({
						['<C-k>'] = cmp.mapping.scroll_docs(-1),
						['<C-j>'] = cmp.mapping.scroll_docs(1),
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-e>'] = cmp.mapping.abort(),
						['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
						['<Tab>'] = cmp.mapping(function(fallback) -- Tab completion
							if cmp.visible() then
								cmp.select_next_item()
							elseif luasnip.expand_or_jumpable() then
								luasnip.expand_or_jump()
							else
								fallback()
							end
						end, { 'i', 's' }),
						['<S-Tab>'] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif luasnip.jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end, { 'i', 's' }),
					}),
					sources = cmp.config.sources({
						{ name = 'luasnip' }, -- For luasnip users.
						{ name = 'buffer' }, -- Working
						{ name = 'nvim_lsp' },
						{ name = 'nvim_lsp_signature_help' },
						{ name = 'calc' }, -- Working
						{ name = 'path' }, -- Working
					})
				},
				cmp.setup.cmdline(':', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = 'cmdline' }, -- Good
						{ name = 'path' } -- Good
					}
				}),
				cmp.setup.cmdline('/', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = 'buffer' }, -- Good
						{ name = 'path' } -- Good
					}
				})
		end,
	},

}
