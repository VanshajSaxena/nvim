return {

  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>sp",
        "<cmd>FzfLua builtin<cr>",
        desc = "FzfLua builtins",
      },

      { "<leader>sz", "<cmd>FzfLua blines<cr>", desc = "Current Buffer" },

      { "<leader>sZ", "<cmd>FzfLua lines<cr>", desc = "Open Buffers" },

      {
        "<leader>fC",
        function()
          require("fzf-lua").live_grep({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Grep Config files",
      },

      {
        "<leader>f.",
        function()
          require("fzf-lua").files({ cwd = vim.fn.expand("$HOME/.config") })
        end,
        desc = "Find Files $HOME/.config",
      },

      {
        "<leader>f,",
        function()
          require("fzf-lua").live_grep({ cwd = vim.fn.expand("$HOME/.config") })
        end,
        desc = "Grep $HOME/.config",
      },

      {
        "<leader>sl",
        function()
          require("fzf-lua").files({ cwd = vim.fn.stdpath("data") .. "/lazy/LazyVim" })
        end,
        desc = "Find Files LazyVim",
      },

      {
        "<leader>sL",
        function()
          require("fzf-lua").live_grep({ cwd = vim.fn.stdpath("data") .. "/lazy/LazyVim" })
        end,
        desc = "Grep LazyVim",
      },
      {
        "<localleader>no",
        function()
          require("fzf-lua").files({ cwd = vim.fn.expand("$HOME/neorg/notes") })
        end,
        desc = "Find Notes",
      },
      {
        "<localleader>nO",
        function()
          require("fzf-lua").live_grep({ cwd = vim.fn.expand("$HOME/neorg/notes") })
        end,
        desc = "Grep Notes",
      },
    },

    opts = {
      winopts = {
        preview = {
          title = false,
          delay = 10,
          winopts = {
            relativenumber = true,
            list = true,
            signcolumn = "yes",
            foldenable = true,
          },
        },
      },
    },
  },
}
