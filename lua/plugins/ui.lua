return {

  {
    "j-hui/fidget.nvim",
    cond = not vim.g.started_by_firenvim,
    event = "LspAttach",
    opts = {
      notification = {
        window = {
          winblend = 0,
          x_padding = 0,
        },
      },
    },
  },

  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
    keys = {
      { "<C-s>r", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Cellular Automaton (make it rain)" },
      { "<C-s>s", "<cmd>CellularAutomaton scramble<cr>", desc = "Cellular Automaton (scramble)" },
    },
  },
}
