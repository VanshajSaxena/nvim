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
}
