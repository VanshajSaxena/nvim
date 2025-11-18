return {
  {
    "LazyVim",
    opts = {
      colorscheme = function()
        if Termux then
          vim.cmd("colorscheme default")
          vim.cmd("hi Normal guibg=NONE")
          vim.cmd("hi NormalFloat guibg=NONE")
        elseif vim.g.neovide or vim.env.EDITOR == "neovide" then
          vim.cmd("colorscheme kanagawa")
        else
          vim.cmd("colorscheme kanagawa")
        end
      end,
    },
  },

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

  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },

      overrides = function(colors)
        return {
          Pmenu = { bg = "none" },
          PmenuSel = { bg = "#393836" },
          BlinkCmpMenuBorder = { bg = "none", fg = "#827b71" },
          BlinkCmpDoc = { link = "Pmenu" },
          BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },
          BlinkCmpSignatureHelp = { link = "Pmenu" },
          BlinkCmpSignatureHelpBorder = { link = "BlinkCmpMenuBorder" },
          HoverBorder = { link = "BlinkCmpMenuBorder" },
          HoverNormal = { link = "Pmenu" },
          SagaBorder = { link = "BlinkCmpMenuBorder" },
          SagaNormal = { link = "Pmenu" },
        }
      end,
      theme = "dragon", -- Load "wave" theme
      background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    },
  },
}
