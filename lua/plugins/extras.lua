return {

  {
    "kawre/leetcode.nvim",
    enabled = not Termux, -- disable on termux
    lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
    build = ":TSUpdate html",
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "java",
      plugins = {
        non_standalone = true,
      },
    },
  },

  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    keys = {
      { "<localleader>nj", "<cmd>Neorg journal today<cr>", desc = "[neorg] Journal Today" },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.ui.calendar"] = {},
          ["core.export"] = {},
          ["core.journal"] = {
            config = {
              workspace = "journal",
            },
          },
          ["core.dirman"] = {
            config = {
              default_workspace = "notes",
              use_popup = true,
              workspaces = {
                journal = "~/neorg",
                short_notes = "~/neorg/short_notes",
                notes = "~/neorg/notes",
              },
            },
          },
          -- ["core.completion"] = {
          --   config = {
          --     engine = "nvim-cmp",
          --   },
          -- },
        },
      })
    end,
  },
}
