return {

  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        --disabled if favour of blink.cmp signature help
        signature = {
          enabled = false,
        },
      },
    },
  },
}
