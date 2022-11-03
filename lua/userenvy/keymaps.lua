local vim = vim
local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
--vim.g.maplocalleader = " "

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<leader>fc", "<cmd>lua require('telescope.builtin').find_files({cwd = vim.fn.expand('/home/userenvy/.config/nvim')})<CR>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep({hidden=true},{cwd = vim.fn.expand('/home/userenvy/')})<CR>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<leader>fn", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser({hidden=true})<CR>", opts)
keymap("n", "<leader>fl", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)

keymap("n", "<leader>w", "<C-w><C-w>", opts)
keymap("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>]", "<cmd>bnext<CR>", opts)
keymap("n", "<leader>[", "<cmd>bNext<CR>", opts)
keymap("n", "<leader>p", "\"_dp", opts)
keymap("n", "<leader>p", "\"_dP", opts)
keymap("n", "<C-c>", ":Copilot panel<CR>", opts)
