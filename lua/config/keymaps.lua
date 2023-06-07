
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
--vim.g.maplocalleader = " "

--Tmux open-float mappings
keymap("n", "<leader>gg", ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E lazygit<CR>", opts)
keymap("n", "<leader>*", ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E<CR>", opts)
keymap("n", "<leader>H", ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E htop<CR>", opts)


keymap("n", "<Tab>", "<C-w>w", opts)
keymap("n", "<S-Tab>", "<C-w>W", opts)

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  vim.keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

vim.keymap.set("i", "<C-s>", '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set("n", "gb","<cmd>BufferLinePick<CR>")
vim.keymap.set("n", "gD","<cmd>BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>F",vim.lsp.buf.format)
-- Lazy mappings
vim.keymap.set("n","<leader>lp","<cmd>Lazy profile<cr>")
