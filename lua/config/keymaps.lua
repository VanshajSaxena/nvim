
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
--vim.g.maplocalleader = " "

--Tmux open-float mappings
keymap("n", "<leader>gg", ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E lazygit<CR>", opts)
keymap("n", "<leader>*", ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E<CR>", opts)
keymap("n", "<leader>H", ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E htop<CR>", opts)

vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

vim.keymap.set("i", "<C-s>", '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- Lazy mappings
vim.keymap.set("n","<leader>lp","<cmd>Lazy profile<cr>")
