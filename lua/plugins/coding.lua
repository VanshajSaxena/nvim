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
			'hrsh7th/cmp-nvim-lsp-signature-help', --Works after completing paran opening, inside paran
			'onsails/lspkind.nvim'
		},

		opts = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			local lspkind = require('lspkind')
			-- local select_opts = { behavior = cmp.SelectBehavior.Insert } -- select_opts to have insert behavior while using tab
			return {
					completion = {
						--completeopt = 'menu,menuone'
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = {
							max_height = 23, -- number of lines doc window can spawn
							max_width = 75, -- number of characters doc window can use for width
							-- [[this next block has been copied from cmp.config.window.bordered()]]
							border = 'rounded',
							winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
							zindex = 1001,
							scrolloff = 0,
							col_offset = 0,
							side_padding = 1,
							scrollbar = true,
						}
					},
					snippet = {
						expand = function(args)
							require('luasnip').lsp_expand(args.body)
						end,
					},
					formatting = {
						fields = { 'abbr', 'menu', 'kind' }, -- these fiels decide the members of cmp-pmenu; see help cmp-config.formatting.fields
						--  fields = { 'abbr', 'menu', 'kind'}, -- is a working sequence of fields for jdtls and lua_ls
						format =
							lspkind.cmp_format({
								mode = 'symbol_text', -- show only symbol annotations
								maxwidth = 15, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
								ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
								-- The function below will be called before any actual modifications from lspkind
								-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
								---@diagnostic disable-next-line: unused-local
								before = function(entry, vim_item)
									local maxwidth_cmp = 15
									local cmp_label = vim_item.menu
									local truncated_cmp_label = vim.fn.strcharpart(cmp_label, 0, maxwidth_cmp)
									if truncated_cmp_label ~= cmp_label then
										vim_item.menu = truncated_cmp_label .. '...'
									end
									if vim_item.menu == 'v:null...' then
										vim_item.menu = ' '
									end
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
						{ name = 'nvim_lsp', }, --keyword_length to specify no. of characters to begin querying the source
						{ name = 'nvim_lsp_signature_help' },
						{ name = 'luasnip', }, -- For luasnip users.
						{ name = 'buffer', }, -- keyword_length = 3  -- Working
						{ name = 'calc' }, -- Working
						{ name = 'path' }, -- Working
					})
				},
				---@diagnostic disable-next-line: missing-fields
				cmp.setup.cmdline(':', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = 'cmdline' }, -- Good
						{ name = 'path' } -- Good
					}
				}),
				---@diagnostic disable-next-line: missing-fields
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
