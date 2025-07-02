local keymap = vim.keymap.set

vim.keymap.del("n", "<leader>l") -- Disable Lazy Home
vim.keymap.del("n", "<leader>L") -- Disable Lazyvim changelog
vim.keymap.del({ "n", "i", "x" }, "<C-s>")
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

keymap("n", "<leader>lp", "<cmd>Lazy<cr>", { desc = "Lazy Profile" })
keymap("n", "<leader>lE", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })

keymap("i", "<C-l>", "<right>", { desc = "move right in insert mode" })
keymap("i", "<C-j>", "<down>", { desc = "move down in insert mode" })
