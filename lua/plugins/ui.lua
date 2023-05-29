return{
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()

			return {
				options = {
					theme = "auto",
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							'diagnostics',
							-- Table of diagnostic sources, available sources are:
							--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
							-- or a function that returns a table as such:
							--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
							sources = { 'nvim_lsp'},

							-- Displays diagnostics for the defined severity types
							sections = { 'error', 'warn', 'info'},

							symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
							colored = true,           -- Displays diagnostics status in color if set to true.
							update_in_insert = false, -- Update diagnostics in insert mode.
							always_visible = false,   -- Show diagnostics even if there are none.
						},
					},
					lualine_x = {
						-- stylua: ignore
						{
							function() return "  " .. require("dap").status() end,
							cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
						},
						{ require("lazy.status").updates, cond = require("lazy.status").has_updates },
						{ "fileformat", icon_only = true, icon = {align = 'right'}},
						{"filetype", icon_only = true}
					},
				},
				extensions = { "neo-tree", "lazy" },
			}
		end,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },
}

