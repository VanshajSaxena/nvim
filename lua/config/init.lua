require("config.lazy")
require("config.options")

if vim.fn.argc(-1) == 0 then
-- autocmds and keymaps can wait to load
vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
	end,
})
else
require("config.keymaps")
end
