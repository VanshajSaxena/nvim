return {

  {
    "seghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
          winblend = 0,
          draw = {
            columns = { { "label", "label_description", gap = 5 }, { "kind_icon", "kind" } },
          },
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cond = not Termux,
    opts = {
      filetypes = {
        java = false,
      },
    },
    keys = {
      { "<leader>uo", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
    },
  },
}
