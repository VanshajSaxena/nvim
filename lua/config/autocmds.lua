local function augroup(name)
	return vim.api.nvim_create_augroup('augroup_' .. name, { clear = true })
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

-- touchegg files are xml types
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
	group = augroup('touchegg_xml'),
	pattern = vim.fn.expand('$HOME') .. '/.config/touchegg/*',
	command = 'set filetype=xml'
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
		Utils.ExposeC()
	end
})

-- Compile Java files
vim.api.nvim_create_autocmd('FileType', {
	group = augroup('CompileJava'),
	pattern = { 'java' },
	callback = function()
		require('config.utils')
		Utils.ExposeJava()
	end
})

-- Interpret Python files
vim.api.nvim_create_autocmd('FileType', {
	group = augroup('InterpretPy'),
	pattern = { 'python' },
	callback = function()
		require('config.utils')
		Utils.ExposePy()
	end
})
