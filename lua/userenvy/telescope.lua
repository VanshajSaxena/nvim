require("telescope").setup()

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    selection_strategy = "follow",
    initial_mode = "insert",
	color_devicons = true,
	multi_icon = " ",
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
		file_browser = ({
				hidden = true,
				initial_mode = "normal",
				theme = "ivy",
				hijack_netrw = true,
				})
    ["ui-select"] == {
      require("telescope.themes").get_dropdown {
      }
    }
  }
}
require("telescope").load_extension("ui-select")
require("telescope").load_extension("file_browser")
