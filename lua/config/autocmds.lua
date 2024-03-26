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
	command = 'set mps+==:;'
})

vim.api.nvim_create_autocmd('FileType',{
	group = augroup('swift_wrap'),
	pattern = {'swift'},
	callback = function()
		vim.wo.wrap = true
	end,
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
		require('config.utils').ExposeC()
	end
})

-- Compile Java files
vim.api.nvim_create_autocmd('FileType', {
	group = augroup('CompileJava'),
	pattern = { 'java' },
	callback = function()
		require('config.utils').ExposeJava()
	end
})

-- Interpret Python files
vim.api.nvim_create_autocmd('FileType', {
	group = augroup('InterpretPy'),
	pattern = { 'python' },
	callback = function()
		require('config.utils').ExposePy()
	end
})

-- inlayHints
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup('inlayHints'),
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})
