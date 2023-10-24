local function compileC()
	-- code
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
		print('file compiled')
	else
		print('Not a C/C++ file')
	end
end

vim.api.nvim_create_user_command('CompileC', compileC, { desc = 'compile C file' })
vim.keymap.set('n', '<leader>CC', compileC, { desc = 'compile C file' })
