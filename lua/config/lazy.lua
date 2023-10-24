local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require('config.init')

local opts = {
	spec = {
		{ import = 'plugins' },
		{ import = 'plugins.lsp' }
	},
	defaults = {
		lazy = true
	},
	ui = {
		border = "rounded",
	},
	change_detection = {
		notify = false
	},
	performance = {
		rtp = {
			disabled_plugins = {
				'gzip',
				'matchit',
				'netrwPlugin',
				'rplugin',
				'tarPlugin',
				'tohtml',
				'tutor',
				'zipPlugin',
				'spellfile',
			},
		}
	}
}
require('lazy').setup(opts)
