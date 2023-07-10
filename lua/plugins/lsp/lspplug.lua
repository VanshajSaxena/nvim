return {
	'ray-x/navigator.lua',
	event = { 'BufReadPre', 'BufReadPost' },
	config = function()
		require('navigator').setup({
			lsp = {
				disable_lsp = 'all'
			}
		})
	end
}
