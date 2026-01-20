return {

  {
    "ibhagwan/fzf-lua",
    enabled = false,

    opts = {
      winopts = {
        preview = {
          title = false,
          delay = 10,
          winopts = {
            relativenumber = true,
            list = true,
            signcolumn = "yes",
            foldenable = true,
          },
        },
      },
    },
  },

  {
    "Jezda1337/nvim-html-css",
    dependencies = { "saghen/blink.cmp", "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable_on = {
        "html",
        "htmldjango",
        "tsx",
        "jsx",
        "erb",
        "svelte",
        "vue",
        "blade",
        "php",
        "templ",
        "astro",
      },
      handlers = {
        definition = {
          bind = "gd",
        },
        hover = {
          bind = "K",
          wrap = true,
          border = "none",
          position = "cursor",
        },
      },
      documentation = {
        auto_show = true,
      },
    },
  },
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true, -- Automatically loads when required by blink.cmp
    opts = {},
  },
}
