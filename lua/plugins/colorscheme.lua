return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
      transparent_mode = not vim.g.neovide,
      overrides = {
        Pmenu = { bg = "none" }, -- blink.cmp uses Pmenu for completion menu, it makes it transparent.
      },
    },
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
    "catppuccin/nvim",
    opts = {
      transparent_background = true, -- disables setting the background color.
      highlight_overrides = {
        all = function(colors)
          return {
            ["@lsp.type.interface.java"] = { fg = "#b3f2e5" },
          }
        end,
      },
    },
  },

  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      theme = "zen", -- [zen | ink | pearl]
      overrides = function(colors)
        return {
          BlinkCmpMenuBorder = { link = "FloatBorder" },
        }
      end,
    },
  },
}
