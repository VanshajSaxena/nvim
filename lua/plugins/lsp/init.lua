return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile"},
		dependencies = {
			  { "folke/neodev.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			
		},

	}
}
