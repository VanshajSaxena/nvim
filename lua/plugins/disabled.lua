return {

  {
    "folke/noice.nvim",
    enabled = true,
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
