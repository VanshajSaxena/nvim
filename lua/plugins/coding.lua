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
		event = { 'InsertEnter' },
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',       --Works
			'hrsh7th/cmp-buffer',         --Works
			'hrsh7th/cmp-path',           --Works
			'hrsh7th/cmp-calc',           --Works
			'hrsh7th/cmp-cmdline',        --Cmdline Completion
			'saadparwaiz1/cmp_luasnip',   --Works
			'hrsh7th/cmp-nvim-lsp-signature-help', -- Works after completing paran opening, inside paran
		},

		opts = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			-- local select_opts = { behavior = cmp.SelectBehavior.Insert } -- select_opts to have insert behavior while using tab
			return {
					completion = {
						completeopt = 'menu,menuone'
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
						fields = { 'abbr', 'menu', 'kind' }, -- these fiels decide the members of cmp-pmenu; see help cmp-config.formatting.fields
						--  fields = { 'abbr', 'menu', 'kind'}, -- is a working sequence of fields for jdtls and lua_ls
					},
					mapping = cmp.mapping.preset.insert({
						['<C-k>'] = cmp.mapping.scroll_docs(-1),
						['<C-j>'] = cmp.mapping.scroll_docs(1),
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-e>'] = cmp.mapping.abort(),
						['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
						['<Tab>'] = cmp.mapping(function(fallback) -- Tab completion
							if cmp.visible() then
								cmp.select_next_item()   -- set select_opts
							elseif luasnip.expand_or_jumpable() then
								luasnip.expand_or_jump()
							else
								fallback()
							end
						end, { 'i', 's' }),
						['<S-Tab>'] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item() -- set select_opts
							elseif luasnip.jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end, { 'i', 's' }),
					}),
					sources = cmp.config.sources({
						{ name = 'nvim_lsp',               keyword_length = 1 }, --keyword_length to specify no. of characters to begin querying the source
						{ name = 'luasnip',                keyword_length = 2 }, -- For luasnip users.
						{ name = 'buffer',                 keyword_length = 3 }, -- Working
						{ name = 'calc' },                     -- Working
						{ name = 'path' },                     -- Working
						{ name = 'nvim_lsp_signature_help' },
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
