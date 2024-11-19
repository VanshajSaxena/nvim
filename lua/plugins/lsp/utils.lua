return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = "Lspsaga",

    opts = {
      finder = {
        default = "def+ref+imp",
        keys = {
          split = "h",
        },
      },
      callhierarchy = {
        key = {
          edit = "o",
          split = "h",
        },
      },
      definition = {
        keys = {
          vsplit = "s",
          split = "h",
          tabe = "t",
          edit = "o",
        },
      },
      rename = {
        quit = "q",
      },
      symbol_in_winbar = {
        enable = true,
        respect_root = true,
        color_mode = true,
      },
      lightbulb = {
        enable = false,
      },
      ui = {
        code_action = "󰌶 ",
        winblend = 0,
        max_preview_lines = 10,
        border = "rounded",
      },
    },

    -- stylua: ignore
    keys = {
      { "gh", "<cmd>Lspsaga finder ++inexist<cr>", desc = "lspsaga finder" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "lspsaga goto definition" },
      { "<leader>gp", "<cmd>Lspsaga peek_definition<cr>", desc = "lspsaga peek definition" },
      { "K", "<cmd>Lspsaga hover_doc ++quiet<cr>", desc = "lspsaga hover doc" },
      { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "lspsaga outline" },
      { "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "lspsaga incoming calls (call hierarchy)", },
      { "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "lspsaga outgoing calls (call hierarchy)", },
    },
  },
}
