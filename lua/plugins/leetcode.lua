return {
  "kawre/leetcode.nvim",
  enabled = not IsTermux, -- disable on termux
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "java",
    plugins = {
      non_standalone = true,
    },
  },
}
