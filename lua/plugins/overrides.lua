return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim",
    opts = {
      colorscheme = function()
        if Termux then
          vim.cmd("colorscheme default")
          vim.cmd("hi Normal guibg=NONE")
          vim.cmd("hi NormalFloat guibg=NONE")
        else
          vim.cmd("colorscheme gruvbox")
        end
      end,
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({ reset = true }) end, desc = "Dap UI" },
      { "<F12>", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
  },

  {
    "mfussenegger/nvim-dap",
    -- stylua: ignore
    keys = { { "<F33>", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Dap Breakpoint Condition (Ctrl + F9)", },
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Dap Toggle Breakpoint", },
      { "<F5>", function() require("dap").continue() end, desc = "Dap Continue", },
      { "<F53>", function() require("dap").run_to_cursor() end, desc = "Dap Run To Cursor (Alt + F5)", },
      { "<F11>", function() require("dap").step_into() end, desc = "Dap Step Into", },
      { "<F23>", function() require("dap").step_out() end, desc = "Dap Step Out (Shift + F11)", },
      { "<F10>", function() require("dap").step_over() end, desc = "Dap Step Over", },
      { "<F17>", function() require("dap").terminate() end, desc = "Dap Terminate (Shift + F5)", },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          signatureHelp = { enabled = true, description = { enabled = true } },
          contentProvider = { preferred = "fernflower" },
          completion = {
            chain = {
              enabled = true,
            },
          },
          codeGeneration = {
            generateComments = {
              enabled = true,
            },
            toString = {
              codeStyle = "STRING_BUILDER",
            },
          },
          edit = {
            smartSemicolon = {
              enabled = true,
            },
          },
          inlayHints = {
            parameterNames = {
              enabled = "all",
            },
            variableTypes = {
              enabled = "all",
            },
            returnType = {
              enabled = "all",
            },
          },
          referencesCodeLens = {
            enabled = true,
          },
        },
      },
    },
  },

  {
    "mini.surround",
    opts = {
      search_method = "cover_or_next",
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      scratch = { enabled = false },
    },
    keys = {
      -- stylua: ignore start
      { "<leader>tg", function() require("snacks").terminal.toggle("tig") end, desc = "Snacks Terminal Tig", },
      { "<leader>yz", function() require("snacks").terminal.toggle("yazi") end, desc = "Snacks Terminal Yazi", },
      { "<leader>bt", function() require("snacks").terminal.toggle("btop") end, desc = "Snacks Terminal Btop", },
      { "<leader>n", false },
    },
  },

  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        REVISE = { icon = " ", alt = { "REVISION", "SEEME" } },
        BOOKMARK = { icon = " ", color = "hint", alt = { "MARK" } },
      },
    },
  },
}
