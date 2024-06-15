return {
  {
    "nvim-telescope/telescope.nvim",

    keys = {
      {
        "<leader>sp",
        "<cmd>Telescope builtin<cr>",
        desc = "telescope builtins",
      },
      {
        "<leader>fC",
        "<cmd> lua require('telescope.builtin').live_grep({ cwd = vim.fn.stdpath('config') })<cr>",
        desc = "Grep Config files",
      },
      {
        "<leader>f.",
        "<cmd> lua require('telescope.builtin').find_files({cwd = vim.fn.expand('$HOME/.config')})<cr>",
        desc = "Find Files $HOME/.config",
      },
      {
        "<leader>f,",
        "<cmd> lua require('telescope.builtin').live_grep({cwd = vim.fn.expand('$HOME/.config')})<cr>",
        desc = "Grep $HOME/.config",
      },
    },

    opts = {
      defaults = {
        selection_strategy = "follow",
        mappings = {
          n = {
            ["t"] = function(...)
              return require("telescope.actions").file_tab(...)
            end,
            ["s"] = function(...)
              return require("telescope.actions").file_vsplit(...)
            end,
            ["h"] = function(...)
              return require("telescope.actions").file_split(...)
            end,
          },
        },
      },
    },
  },
}
