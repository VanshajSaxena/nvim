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
        "<leader><space>",
        function()
          local root = vim.fs.root(0, ".git")
          if root ~= nil then
            require("telescope.builtin").find_files({ cwd = root })
          else
            vim.cmd("Telescope projects")
          end
        end,
        desc = "Projects or Find Files based on the buffer",
      },

      { "<leader>sz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },

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

      {
        "<leader>sl",
        "<cmd> lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim'})<cr>",
        desc = "Find Files LazyVim",
      },

      {
        "<leader>sL",
        "<cmd> lua require('telescope.builtin').live_grep({cwd = vim.fn.stdpath('data') .. '/lazy/LazyVim'})<cr>",
        desc = "Grep LazyVim",
      },
    },

    opts = {
      defaults = {
        selection_strategy = "closest",
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
            ["<C-D>"] = function(...)
              return require("telescope.actions").results_scrolling_down(...)
            end,
            ["<C-U>"] = function(...)
              return require("telescope.actions").results_scrolling_up(...)
            end,
            ["J"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["K"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          i = {
            ["<C-D>"] = function(...)
              return require("telescope.actions").results_scrolling_down(...)
            end,
            ["<C-U>"] = function(...)
              return require("telescope.actions").results_scrolling_up(...)
            end,
          },
        },
      },
    },
  },
}
