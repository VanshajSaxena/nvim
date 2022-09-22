local vim = vim
local o = vim.opt
-- Treesitter 
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99
