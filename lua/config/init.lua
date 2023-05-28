require("config.options")
if vim.fn.argc(-1) == 0 then --argc(-1) for global arglist
-- autocmds and keymaps can wait to load
vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("UserAuGrp", { clear = true }),
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
		require("config.autocmds")
	end,
})
else
require("config.keymaps")
require("config.autocmds")
end
