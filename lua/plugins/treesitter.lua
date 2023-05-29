return{
  {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = function()
	  require('nvim-treesitter.install').update({ with_sync = true })
	end,
	event = { "BufReadPost", "BufNewFile" },
	keys = {
	  { "<c-space>", desc = "Increment selection" },
	  { "<bs>", desc = "Decrement selection", mode = "x" },
	},
  config = function ()
	  local config_opts ={ -- A list of parser names, or "all"
	ensure_installed = {  "c", "cpp", "java", "json", "lua", "vim", "vimdoc"  },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = {},

	highlight = {
	  -- `false` will disable the whole extension
	  enable = true,
	  -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
	  -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
	  -- the name of the parser)
	  -- list of language that will be disabled
	  disable = false,
	  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	  -- Using this option may slow down your editor, and you may see some duplicate highlights.
	  -- Instead of true it can also be a list of languages
	  additional_vim_regex_highlighting = false,
	},
	indent = {
	  enable = true
	},
	incremental_selection = {
	  enable = true,
	  keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
	  },
	},
  }
	require("nvim-treesitter.configs").setup(config_opts)
  end
}
}
