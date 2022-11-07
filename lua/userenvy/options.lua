local vim = vim
local o = vim.opt

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.hidden = true
o.encoding = "UTF-8"
o.swapfile = false
o.incsearch = true
o.autoindent = true
o.termguicolors = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 2
o.undofile = true
o.showtabline = 2
o.cursorline = true
o.wrap = false
o.scrolloff = 20
o.sidescrolloff = 20
o.hlsearch = false
o.mouse = "nv"
o.smartcase = true
o.ignorecase = true
o.background = "dark"
o.signcolumn = "yes:1"
---@diagnostic disable-next-line: undefined-global
o.syntax = on

o.inccommand = "split"

vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE]])
