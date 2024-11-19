return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      if vim.g.neovide then
        require("gruvbox").setup({
          contrast = "hard",
          transparent_mode = false,
        })
      elseif require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = true,
      }) then
      end
    end,
  },

  {
    "tokyonight.nvim",
    opts = {
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      transparent = true, -- Enable this to disable setting the background color
      styles = {
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
    },
  },

  {
    "catppuccin.nvim",
    enabled = false,
  },
}
