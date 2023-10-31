local keymap = vim.keymap.set
keymap('', '<Space>', '<Nop>', { desc = 'nop' })

--[[
function Keymaps()
	keymap('n', '<leader>gg', ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E lazygit<CR>",
		{ desc = 'tmux open-float lazygit', silent = true })
	keymap('n', '<leader>ti', ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E tig<CR>",
		{ desc = 'tmux open-float tig', silent = true })
	keymap('n', '<leader>*', ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E<CR>",
		{ desc = 'tmux open-float', silent = true })
	keymap('n', '<leader>H', ":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -E htop<CR>",
		{ desc = 'tmux open-float htop', silent = true })
end
]]

--[[
local function openfloat(program, key, desc, silent)
	keymap('n', '<leader>' .. key,
		":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -b rounded -T " ..
		program .. ' -E ' .. program .. ' <CR>',
		{ desc = desc, silent = silent })
end
]]


--[[ Tmux open-float mappings
if os.getenv('OS') == 'Windows_NT' then
	keymap('n', '<leader>gg', "<cmd>lua print('you are not under tmux')<cr>", { desc = 'nop' })
	keymap('n', '<leader>ti', "<cmd>lua print('you are not under tmux')<cr>", { desc = 'nop' })
	keymap('n', '<leader>*', "<cmd>lua print('you are not under tmux')<cr>", { desc = 'nop' })
	keymap('n', '<leader>H', "<cmd>lua print('you are not under tmux')<cr>", { desc = 'nop' })
else
	Keymaps()
end
]]

if os.getenv('TERM_PROGRAM') == 'tmux' then
	local openfloat = function(program, map, desc, silent)
		keymap('n', '<leader>' .. map,
			":silent !tmux display-popup -d '\\#{pane_current_path}' -w80\\% -h80\\% -b rounded -E -T " ..
			program .. ' ' .. program .. '<CR>',
			{ desc = desc, silent = silent })
	end
	openfloat('lazygit', 'gg', 'tmux open-float lazygit', true)
	openfloat('', '>', 'tmux open-float', true)
	openfloat('tig', 'ti', 'tmux open-float tig', true)
	openfloat('htop', 'H', 'tmux open-float htop', true)
	openfloat('btop', 'B', 'tmux open-float btop', true)
elseif os.getenv('OS') == 'Windows_NT' then
	local openfloat = function(program, map, desc, silent)
		keymap('n', '<leader>' .. map, '<cmd>Lspsaga term_toggle ' .. program .. '<CR>', { desc = desc, silent = silent })
	end
	openfloat('lazygit', 'gg', 'Lspsaga term_toggle lazygit', true)
	openfloat('pwsh', '>', 'Lspsaga term_toggle', true)
end

keymap('n', '<Tab>', '<C-w>w', { desc = 'tab switching' })
keymap('n', '<S-Tab>', '<C-w>W', { desc = 'tab switch (shift)' })

-- Highlights under cursor
if vim.fn.has('nvim-0.9.0') == 1 then
	keymap('n', '<leader>ui', vim.show_pos, { desc = 'inspect pos' })
end

--keymap('n', 'q:', '<nop>', { desc = 'nop' })
keymap('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'move down' })
keymap('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'move up' })
keymap('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'move down (insert)' })
keymap('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'move up (insert)' })
keymap('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'move down (visual)' })
keymap('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'move up (visual)' })
keymap('i', '<C-l>', '<esc>la', { desc = 'move right in insert mode' })
keymap('n', '<leader>ss', '<cmd>vertical sbnext<cr>', { desc = 'split window in two and edit alternate file (vertical)' })
keymap('n', '<leader>[', '<cmd>bnext<cr>', { desc = 'buffer next' })
keymap('n', '<leader>]', '<cmd>bNext<cr>', { desc = 'buffer previous' })
keymap('n', 'gb', '<cmd>BufferLinePick<CR>', { desc = 'bufferline pick' })
keymap('n', 'gD', '<cmd>BufferLinePickClose<CR>', { desc = 'bufferline pick close' })
keymap('n', '<leader>F', vim.lsp.buf.format, { desc = 'lsp format' })
keymap({ 'n', 'i' }, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = 'signature help' })
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'code action' })

-- Lazy mappings
keymap('n', '<leader>lp', '<cmd>Lazy profile<cr>', { desc = 'lazy profile' })

-- Jdtls mappings
keymap('n', '<leader>jr', '<cmd>JdtRestart<cr>', { desc = 'jdtls restart' })
keymap('n', '<leader>jwr', '<cmd>JdtWipeDataAndRestart<cr>', { desc = 'jdtls wipe data and restart' })
keymap('n', '<leader>juc', '<cmd>JdtUpdateConfig<cr>', { desc = 'jdtls update config' })
keymap('n', '<leader>judc', '<cmd>JdtUpdateDebugConfig<cr>', { desc = 'jdtls update debug config' })
