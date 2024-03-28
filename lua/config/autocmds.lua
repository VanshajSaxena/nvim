-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("augroup_" .. name, { clear = true })
end
--:au filetype c,cpp,java set mps+==:;
vim.api.nvim_create_autocmd("filetype", {
  group = augroup("matchpairs"),
  pattern = { "c", "cpp", "java" },
  command = "set mps+==:;",
})

-- touchegg files are xml types
vim.api.nvim_create_autocmd({ "bufreadpost", "bufnewfile" }, {
  group = augroup("touchegg_xml"),
  pattern = vim.fn.expand("$home") .. "/.config/touchegg/*",
  command = "set filetype=xml",
})

-- managing comment options
vim.api.nvim_create_autocmd("filetype", {
  group = augroup("formatoptions"),
  pattern = "*",
  command = "set formatoptions+=t | set formatoptions-=cro",
})
