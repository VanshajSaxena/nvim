local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
--vim.g.maplocalleader = " "

local function keymaps()
	keymap('n', '<leader>gg', ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E lazygit<CR>",
		opts)
	keymap('n', '<leader>ti', ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E tig<CR>", opts)
	keymap('n', '<leader>*', ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E<CR>", opts)
	keymap('n', '<leader>H', ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E htop<CR>", opts)
end

-- Tmux open-float mappings
if os.getenv('OS') == 'Windows_NT' then
	keymap('n', '<leader>gg', "<cmd>lua print('you are not under tmux')<cr>", opts)
	keymap('n', '<leader>ti', "<cmd>lua print('you are not under tmux')<cr>", opts)
	keymap('n', '<leader>*', "<cmd>lua print('you are not under tmux')<cr>", opts)
	keymap('n', '<leader>H', "<cmd>lua print('you are not under tmux')<cr>", opts)
else
	keymaps()
end

keymap('n', '<Tab>', '<C-w>w', opts)
keymap('n', '<S-Tab>', '<C-w>W', opts)

-- Highlights under cursor
if vim.fn.has('nvim-0.9.0') == 1 then
	vim.keymap.set('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
end

vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })
vim.keymap.set('n', 'gb', '<cmd>BufferLinePick<CR>')
vim.keymap.set('n', 'gD', '<cmd>BufferLinePickClose<CR>')
vim.keymap.set('n', 'q:', '<cmd>lua print("Ex-mode disabled.")<CR>')

vim.keymap.set('n', '<leader>F', vim.lsp.buf.format)
vim.keymap.set('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
-- Lazy mappings
vim.keymap.set('n', '<leader>lp', '<cmd>Lazy profile<cr>')
