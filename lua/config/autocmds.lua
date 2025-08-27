local function augroup(name)
  return vim.api.nvim_create_augroup("usercommands_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("filetype", {
  group = augroup("matchpairs"),
  pattern = { "*.c", "*.cpp" },
  command = "set mps+==:;",
  desc = "set matchpairs for c, cpp",
})

vim.api.nvim_create_autocmd({ "bufreadpre" }, {
  group = augroup("URS_2016"),
  pattern = "D:/Projects/URS_Code/URS_2016/**",
  command = "set readonly",
  desc = "set files readonly for the project URS_2016",
})

vim.api.nvim_create_autocmd({ "bufreadpost", "bufnewfile" }, {
  group = augroup("touchegg_xml"),
  pattern = vim.fs.normalize("$home") .. "/.config/touchegg/*",
  command = "set filetype=xml",
  desc = "touchegg files are xml types",
})

-- vim.api.nvim_create_autocmd("filetype", {
--   group = augroup("formatoptions"),
--   pattern = "*",
--   command = "set formatoptions+=t | set formatoptions-=cro",
--   desc = "set formatoptions to avoid ambiguous comment behavior",
-- })

vim.api.nvim_create_autocmd("bufreadpost", {
  group = augroup("setwrap"),
  pattern = { "*.swift", "*.norg" },
  callback = function()
    vim.opt.wrap = true
    vim.opt.spell = true
  end,
  desc = "set wrap and spell for swift and norg",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup("texcompile"),
  pattern = { "*.tex" },
  command = "VimtexCompile",
  desc = "autocompile tex files after each write",
})
