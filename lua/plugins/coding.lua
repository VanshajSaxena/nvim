return {

	{
		"L3MON4D3/LuaSnip",
		version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },

		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	{
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
	},
	opts = function()
		local cmp = require("cmp")
		return{
			completion = {
				completeopt = "menu,menuone,noinsert"
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.scroll_docs(-1),
		['<C-j>'] = cmp.mapping.scroll_docs(1),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<Tab>'] = cmp.mapping(function(fallback)   -- Tab completion
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
		{ name = 'nvim_lsp' },
--		{ name = 'nvim_lsp_signature_help' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'buffer' }, -- Working
--		{ name = 'calc' }, -- Working
		{ name = 'path' }, -- Working
	})

}
	end,
}
}
