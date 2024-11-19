return {

  {
    "j-hui/fidget.nvim",
    cond = not vim.g.started_by_firenvim,
    tag = "legacy",
    event = "LspAttach",
    opts = {
      text = {
        spinner = "dots",
        done = "",
        commenced = "Initializing",
        completed = "Setup Complete",
      },
      window = {
        blend = 00,
        relative = "editor",
      },
      fmt = {
        leftpad = false,
        max_width = 45,
        stack_upwards = false,
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
