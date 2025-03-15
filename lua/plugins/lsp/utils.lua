return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = "Lspsaga",

    opts = {
      finder = {
        -- default = "ref+imp",
        keys = {
          shuttle = "<C-w>w",
          vsplit = "<C-v>",
          split = "<C-s>",
          tabe = "<C-t>",
          toggle_or_open = "<cr>",
        },
        methods = {
          tyd = "textDocument/typeDefinition",
        },
      },
      callhierarchy = {
        key = {
          shuttle = "<C-w>w",
          edit = "<cr>",
          split = "<C-s>",
          vsplit = "<C-v>",
          tabe = "<C-t>",
        },
      },
      definition = {
        keys = {
          vsplit = "<C-v>",
          split = "<C-s>",
          tabe = "<C-t>",
          edit = "<cr>",
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
      { "gh", "<cmd>Lspsaga finder def+imp<cr>", desc = "Lspsaga (definitions + implementations)" },
      { "gq", "<cmd>Lspsaga finder ref+tyd<cr>", desc = "Lspsaga (references + type definitions)" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Lspsaga goto definition" },
      { "<leader>gp", "<cmd>Lspsaga peek_definition<cr>", desc = "Lspsaga peek definition" },
      { "K", "<cmd>Lspsaga hover_doc ++quiet<cr>", desc = "Lspsaga hover doc" },
      { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga outline" },
      { "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "Lspsaga incoming calls (call hierarchy)" },
      { "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Lspsaga outgoing calls (call hierarchy)" },
    },
  },
}
