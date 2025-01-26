return {

  {
    "folke/noice.nvim",
    enabled = true,
    cond = not vim.g.started_by_firenvim,
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        --disabled in favour of blink.cmp signature help
        signature = {
          enabled = false,
        },
      },
    },
  },
}
