-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local set = vim.opt

set.completeopt = "menu,menuone,noselect,noinsert,preview"
set.confirm = false
set.hidden = true
set.inccommand = "split"
set.hlsearch = false
set.mouse = "nv"
set.pumblend = 0 -- Popup blend pumblend has to be set to zero for : completion
set.winblend = 0 -- Float-windows blend
set.pumheight = 20 --later to update
set.scroll = 10 -- scroll for CTRL-D and CTRL-U
set.scrolloff = 16
set.sidescrolloff = 48

if os.getenv("OS") == "Windows_NT" then
  vim.cmd([[ let g:clipboard = {
\ 'name': 'win32yank',
\ 'copy': {
\    '+': 'win32yank.exe -i --crlf',
\    '*': 'win32yank.exe -i --crlf',
\  },
\ 'paste': {
\    '+': 'win32yank.exe -o --lf',
\    '*': 'win32yank.exe -o --lf',
\ },
\ 'cache_enabled': 0,
\ }
]])
end

if vim.g.neovide then
  vim.g.neovide_transparency = 1
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  set.pumblend = 85 -- Popup blend pumblend has to be set to zero for : completion
  set.winblend = 85 -- Float-windows blend
end
