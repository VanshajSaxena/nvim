local set = vim.opt
vim.g.mapleader = " "

set.number = true -- Print numbers
set.relativenumber = true -- Relative line numbers
set.hidden = true -- Hidden buffers
set.undofile = true -- Undofile
set.swapfile = false -- No swapfile
set.cursorline = true -- Cursorline
set.conceallevel = 3 -- Hide * markup for bold and italic
set.completeopt = "menu,menuone,noselect"
set.formatoptions = "jcqt,ron" -- Overridden after comma
set.ignorecase = true
set.smartcase = true --override ignorecase when pattern contains uppercase
set.inccommand = "split" --preview incremental substitutes
set.mouse = "nv"     -- n=normal v=visual i=insert
set.pumblend = 25 -- Popup blend
set.winblend = 25 -- Float-windows blend
set.pumheight = 40 -- Maximum number of entries in a popup
set.scrolloff = 8
set.sidescrolloff = 8 -- Columns of context
set.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- Changes the effect of :mksession cmd --test
set.shiftround = true
set.shiftwidth = 4 -- Size of an (auto)indent << >>
set.shortmess:append({ m = true, I = true}) -- m- Modified, I- Intro
set.showmode = false -- Dont show mode since theres a statusline
set.signcolumn = "yes:1"
set.smartindent = true -- Insert indents automatically
set.spelllang = { "en", "en-rare" }
set.splitbelow = true -- Put new windows below current
set.splitright = true -- Put new windows right of current
set.tabstop = 4 -- Number of spaces tabs count for
set.timeoutlen = 1000
set.undolevels = 10000 -- Overridden from 1000
set.updatetime = 1000 -- Trigger CursorHold
set.winminwidth = 5 -- Minimum window width
set.wrap = false -- Disable line wrap

set.termguicolors=true -- True color support 

vim.cmd [[ let g:clipboard = { 
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
]]
set.clipboard = "unnamedplus"
