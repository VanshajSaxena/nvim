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
        --		hide_keyword = true,
        --		show_file = true,
        --		folder_level = 2,
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

    keys = {
      { "gh", "<cmd>Lspsaga finder ++inexist<cr>", desc = "lspsaga finder" },
      --{ "<leader>gr", "<cmd>Lspsaga rename<cr>", desc = "lspsaga rename" },
      --{ "<leader>gR", "<cmd>Lspsaga rename ++project<cr>", desc = "lspsaga rename across project" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "lspsaga goto definition" },
      { "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "lspsaga peek definition" },
      --{ 'sl',         '<cmd>Lspsaga show_line_diagnostics<cr>', desc = 'lspsaga show line diagnostics'},
      --{ 'sc',         '<cmd>Lspsaga show_cursor_diagnostics<cr>', desc = 'lspsaga show cursor diagnostics'},
      --{ 'sb',         '<cmd>Lspsaga show_buf_diagnostics<cr>', desc = 'lspsaga show buffer diagnostics'},
      --{ "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "lspsaga show diagnostics previous" },
      --{ "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "lspsaga show diagnostics next" },
      { "K", "<cmd>Lspsaga hover_doc ++quiet<cr>", desc = "lspsaga hover doc" },
      { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "lspsaga outline" },
      {
        "<leader>ci",
        "<cmd>Lspsaga incoming_calls<cr>",
        desc = "lspsaga incoming calls (call hierarchy)",
      },
      {
        "<leader>co",
        "<cmd>Lspsaga outgoing_calls<cr>",
        desc = "lspsaga outgoing calls (call hierarchy)",
      },
      --{ "<leader>tr", "<cmd>Lspsaga term_toggle<cr>", desc = "lspsaga terminal toggle" },
      --[[
      {
        "[E",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        { desc = "lspsaga show error previous" },
      },
      {
        "E]",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        { desc = "lspsaga show error next" },
      },
      --]]
    },
  },
}
