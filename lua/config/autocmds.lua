local function augroup(name)
	return vim.api.nvim_create_augroup('augroup' .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	group = augroup('highlight_yank'),
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 50 })
	end,
})


--:au FileType c,cpp,java set mps+==:;
vim.api.nvim_create_autocmd('FileType', {
	group = augroup('matchpairs'),
	pattern = { 'c', 'cpp', 'java' },
	callback = function()
		vim.cmd('set mps+==:;')
	end
})

-- managing comment options
vim.api.nvim_create_autocmd('FileType', {
	group = augroup('formatoptions'),
	pattern = '*',
	command = 'set formatoptions+=t | set formatoptions-=cro'
})

-- Compile C/CPP files
vim.api.nvim_create_autocmd('FileType', {
	group = augroup('CompileC'),
	pattern = { 'c', 'cpp' },
	callback = function()
		require('config.utils')
		Utils.Expose()
	end
})
