return {

  {
    "folke/noice.nvim",
    enabled = false,
    cond = not vim.g.started_by_firenvim,
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline",
        format = {
          cmdline = { pattern = "^:", icon = ":", lang = "vim" },
          lua = { pattern = "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*", icon = " ", lang = "vim" },
        },
      },
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
