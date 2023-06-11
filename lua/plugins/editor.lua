return {
	{
		'nvim-tree/nvim-tree.lua',
		version = '*',
		keys = {
			{ '<leader>n', '<cmd>NvimTreeToggle<CR>' }
		},
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			-- This function has been generated from your
			--   view.mappings.list
			--   view.mappings.custom_only
			--   remove_keymaps
			--
			-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
			--
			-- Although care was taken to ensure correctness and completeness, your review is required.
			--
			-- Please check for the following issues in auto generated content:
			--   "Mappings removed" is as you expect
			--   "Mappings migrated" are correct
			--
			-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
			--

			local function on_attach(bufnr)
				local api = require('nvim-tree.api')

				local function opts(desc)
					return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end


				-- Default mappings. Feel free to modify or remove as you wish.
				--
				-- BEGIN_DEFAULT_ON_ATTACH
				vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
				vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
				vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
				vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
				vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
				vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
				vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
				vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
				vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
				vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
				vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
				vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
				vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
				vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
				vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
				vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
				vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
				vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
				vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
				vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
				vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
				vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
				vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
				vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
				vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
				vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
				vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
				vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
				vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
				vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
				vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
				vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
				vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
				vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
				vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
				vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
				vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
				vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
				vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
				vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
				vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
				vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
				vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
				vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
				vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
				vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
				vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
				vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
				vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
				-- END_DEFAULT_ON_ATTACH


				-- Mappings migrated from view.mappings.list
				--
				-- You will need to insert "your code goes here" for any mappings with a custom action_cb
				vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
				vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
				vim.keymap.set('n', '<Tab>', api.tree.close, opts('Close'))
				vim.keymap.set('n', 'v', api.fs.paste, opts('Paste'))
				vim.keymap.set('n', 'p', api.node.open.preview, opts('Open Preview'))
			end
			local config_opts =
			{
				on_attach = on_attach,
				root_dirs = { '.git' },
				update_focused_file = {
					enable = true,
					update_root = true,
					ignore_list = { 'git', 'txt', 'help' },
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
					icons = { hint = ' ', info = ' ', warning = ' ', error = ' ' }
				},
				renderer = {
					indent_markers = {
						enable = true,
						--			inline_arrows = true
					}
				},
				view = {
					centralize_selection = true,
					--relativenumber = true,
					signcolumn = 'yes',
				},
				filters = {
					dotfiles = false,
					custom = { '^\\.git', '.\\.class' }
				}
			}
			require('nvim-tree').setup(config_opts)
		end,
	},

	{
		'nvim-telescope/telescope.nvim',
		commit = vim.fn.has('nvim-0.9.0') == 0 and '057ee0f8783' or nil,
		cmd = 'Telescope',
		version = false, -- telescope did only one release, so use HEAD for now
		keys = {
			{ '<leader>,',  '<cmd>Telescope buffers show_all_buffers=true<cr>',      desc = 'Switch Buffer' },
			{ '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = 'Grep cwd' },
			{ '<leader>/', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = 'Grep cwd' },
			--{ "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
			{ '<leader>:',  '<cmd>Telescope command_history<cr>',                    desc = 'Command History' },
			--{ "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
			-- find
			{ '<leader>fb', '<cmd>Telescope buffers<cr>',                            desc = 'Buffers' },
			{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidded = true})<cr>", desc = "Find Files (root dir -> cwd)" },
			{"<leader>fc", "<cmd> lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('config')})<cr>", desc = 'Find Files (cwd to vim.fn.stdpath("config"))'},
			--{ "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
			{ '<leader>fr', '<cmd>Telescope oldfiles<cr>',                           desc = 'Recent' },
			{ "<leader>fR", "<cmd>lua require('telescope.builtin).oldfiles({cwd = vim.loop.cwd()})<cr>", desc = "Recent (cwd)" },
			-- git
			{ '<leader>gc', '<cmd>Telescope git_commits<CR>',                        desc = 'commits' },
			{ '<leader>gs', '<cmd>Telescope git_status<CR>',                         desc = 'status' },
			{ '<leader>gf', '<cmd>Telescope git_files<CR>',                         desc = 'files tracked by git' },
			-- search
			{ '<leader>sa', '<cmd>Telescope autocommands<cr>',                       desc = 'Auto Commands' },
			{ '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>',          desc = 'Buffer' },
			{ '<leader>sc', '<cmd>Telescope command_history<cr>',                    desc = 'Command History' },
			{ '<leader>sC', '<cmd>Telescope commands<cr>',                           desc = 'Commands' },
			{ '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>',                desc = 'Document diagnostics' },
			{ '<leader>sD', '<cmd>Telescope diagnostics<cr>',                        desc = 'Workspace diagnostics' },
			{ '<leader>uC', '<cmd>Telescope colorscheme enable_preview=true<cr>',   desc = 'Telescope builtin' },
			{ '<leader>sp', '<cmd>Telescope builtin<cr>',                        desc = 'Telescope builtin' },
			--{ "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
			--{ "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
			{ '<leader>sh', '<cmd>Telescope help_tags<cr>',                          desc = 'Help Pages' },
			{ '<leader>sH', '<cmd>Telescope highlights<cr>',                         desc = 'Search Highlight Groups' },
			{ '<leader>sk', '<cmd>Telescope keymaps<cr>',                            desc = 'Key Maps' },
			{ '<leader>sm', '<cmd>Telescope marks<cr>',                              desc = 'Jump to Mark' },
			{ '<leader>sM', '<cmd>Telescope man_pages<cr>',                          desc = 'Man Pages' },
			{ '<leader>so', '<cmd>Telescope vim_options<cr>',                        desc = 'Options' },
			{ '<leader>sR', '<cmd>Telescope resume<cr>',                             desc = 'Resume' },
			{ "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "Word (cwd)" },
			--{ "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
			--{ "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
			--{ "<leader>ss", Util.telescope("lsp_document_symbols", { symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property", }, }), desc = "Goto Symbol", },
			--{ "<leader>sS", Util.telescope("lsp_dynamic_workspace_symbols", { symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property", }, }), desc = "Goto Symbol (Workspace)", },
		},
		opts = {
			defaults = {
				prompt_prefix = ' ',
				selection_caret = ' ',
				mappings = {
					i = {
						['<c-t>'] = function(...)
							return require('trouble.providers.telescope').open_with_trouble(...)
						end,
						['<a-t>'] = function(...)
							return require('trouble.providers.telescope').open_selected_with_trouble(...)
						end,
						['<C-Down>'] = function(...)
							return require('telescope.actions').cycle_history_next(...)
						end,
						['<C-Up>'] = function(...)
							return require('telescope.actions').cycle_history_prev(...)
						end,
						['<C-f>'] = function(...)
							return require('telescope.actions').preview_scrolling_down(...)
						end,
						['<C-b>'] = function(...)
							return require('telescope.actions').preview_scrolling_up(...)
						end,
					},
					n = {
						['q'] = function(...)
							return require('telescope.actions').close(...)
						end,
					},
				},
			},
		},
	},
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" }, --n- Normal 
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" }, --x- Visual 
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" }, --o- Operator-pending
    },
	config = function ()
		  require('leap').add_default_mappings(true)
		  require('leap').init_highlight(true)
		  vim.cmd([[ hi link LeapBackdrop GruvboxGray]])
	end
  }
}
