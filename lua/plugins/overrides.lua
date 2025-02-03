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
    dependencies = {
      "nvim-dap-virtual-text",
      opts = {
        enabled_commands = true,
        highlight_changed_variables = false,
        highlight_new_as_changed = true,
        show_stop_reason = true,
        only_first_definition = false,
        all_references = true,
        clear_on_continue = false,
        -- experimental features:
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil,
      },
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
          --contentProvider = { preferred = "fernflower" },
          completion = {
            guessMethodArguments = "insertBestGuessedArguments",
            chain = {
              enabled = true,
            },
          },
          codeGeneration = {
            generateComments = true,
            toString = {
              codeStyle = "STRING_BUILDER_CHAINED",
            },
            useBlocks = true,
          },
          implementationCodeLens = "none", -- methods | types | all | none
          inlayHints = {
            parameterNames = {
              enabled = "all",
            },
          },
          saveActions = {
            organizeImports = true,
          },
          edit = {
            smartSemicolonDetection = {
              enabled = true,
            },
          },
          referencesCodeLens = {
            enabled = false,
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
      picker = {
        win = {
          preview = {
            wo = {
              relativenumber = true,
              signcolumn = "no",
            },
          },
        },
      },
    },
    keys = {
      -- stylua: ignore start
      { "<leader>tg", function() Snacks.terminal.toggle("tig") end, desc = "Snacks Terminal Tig", },
      { "<leader>yz", function() Snacks.terminal.toggle("yazi") end, desc = "Snacks Terminal Yazi", },
      { "<leader>bt", function() Snacks.terminal.toggle("btop") end, desc = "Snacks Terminal Btop", },
    },
  },

  {
    "folke/todo-comments.nvim",
    opts = {
      -- MARK:
      -- TODO:
      -- PERF:
      -- TEST:
      -- NOTE:
      -- REVISE:
      -- HACK:
      -- WARN:
      -- PENDING:
      -- FIX:
      keywords = {
        PENDING = { icon = " ", color = "orange", alt = { "NOTDONE" } },
        REVISION = { icon = " ", color = "hint", alt = { "REVISE" } },
        BOOKMARK = { icon = " ", color = "blue", alt = { "MARK" } },
      },
      colors = {
        orange = { "Special" },
        blue = { "Identifier" },
      },
    },
  },
}
