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
      cache = {
        update_interval = 60 * 60 * 24, -- 24 hours
      },
      plugins = {
        non_standalone = true,
      },
      image_support = true,
    },
    keys = {
      { "<leader>Lm", "<cmd>Leet<cr>", desc = "Leet Menu" },
      { "<leader>Ll", "<cmd>Leet list<cr>", desc = "Leet List" },
      { "<leader>Ls", "<cmd>Leet submit<cr>", desc = "Leet Submit" },
      { "<F8>", "<cmd>Leet submit<cr>", desc = "Leet Submit" },
      { "<leader>Lr", "<cmd>Leet run<cr>", desc = "Leet Run" },
      { "<F7>", "<cmd>Leet run<cr>", desc = "Leet Run" },
      { "<leader>LR", "<cmd>Leet reset<cr>", desc = "Leet Reset" },
      { "<leader>LL", "<cmd>Leet last_submit<cr>", desc = "Leet Last Submit" },
      { "<leader>Lo", "<cmd>Leet open<cr>", desc = "Leet Open" },
      { "<leader>Lc", "<cmd>Leet console<cr>", desc = "Leet Console" },
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
