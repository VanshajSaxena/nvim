return {
	'ray-x/navigator.lua',
	event = {'BufReadPre','BufReadPost'},
	config = function()
		require('navigator').setup({
			mason = true
		})
	end
}
