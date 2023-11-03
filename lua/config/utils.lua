Utils = {}

Utils.CompileC = function()
	local file_path = vim.fn.expand('%:p') -- file full path of current file
	local filename = vim.fn.expand('%:p:t:r')
	local file_dir = vim.fn.expand('%:p:h')
	local file_ext = vim.fn.expand('%:e')

	if file_ext == 'c' or file_ext == 'cpp' then
		local compile_cmd = ''

		if file_ext == 'c' then
			compile_cmd = 'gcc'
		elseif file_ext == 'cpp' then
			compile_cmd = 'g++'
		end

		vim.cmd('cd ' .. file_dir)
		vim.cmd('silent !' .. compile_cmd .. ' ' .. file_path .. ' -o ' .. filename .. '.out')
		print('File Compiled')
	else
		print('Not a C/C++ file')
	end
end

Utils.ExposeC = function()
	vim.keymap.set('n', '<leader>CC', Utils.CompileC, { desc = 'compile C/CPP file' })
	vim.api.nvim_create_user_command('CompileC', Utils.CompileC, { desc = 'compile C/CPP file' })
end

Utils.CompileJava = function()
	local file_path = vim.fn.expand('%:p') -- file full path of current file
	local file_dir = vim.fn.expand('%:p:h')
	local file_ext = vim.fn.expand('%:e')

	if file_ext == 'java' then
		local compile_cmd = 'javac'
		vim.cmd('cd' .. file_dir)
		vim.cmd('silent !' .. compile_cmd .. ' ' .. file_path)
		print('File Compiled')
	else
		print('Not a Java file')
	end
end

Utils.ExposeJava = function()
	vim.keymap.set('n', '<leader>CC', Utils.CompileJava, { desc = 'compile Java file' })
	vim.api.nvim_create_user_command('CompileJava', Utils.CompileJava, { desc = 'compile Java file' })
end
return Utils