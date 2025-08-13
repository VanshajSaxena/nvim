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
        elseif vim.g.neovide or vim.env.EDITOR == "neovide" then
          vim.cmd("colorscheme kanagawa")
        else
          vim.cmd("colorscheme kanagawa")
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
    keys = {
      { "<leader>dL", function() require("dap").clear_breakpoints() end, desc = "Dap Clear All Breakpoints", },
      { "<F33>", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Dap Breakpoint Condition (Ctrl + F9)", },
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
        -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        java = {
          signatureHelp = { enabled = true, description = { enabled = true } },
          contentProvider = { preferred = "fernflower" },
          completion = {
            guessMethodArguments = "insertBestGuessedArguments",
            chain = {
              enabled = true,
            },
            -- content assist will propose these static members even if the import is missing
            favoriteStaticMembers = {
              -- default list of static members to be used for autocompletion
              "org.junit.Assert.*",
              "org.junit.Assume.*",
              "org.junit.jupiter.api.Assertions.*",
              "org.junit.jupiter.api.Assumptions.*",
              "org.junit.jupiter.api.DynamicContainer.*",
              "org.junit.jupiter.api.DynamicTest.*",

              -- non-default favorite static members
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
              "org.mockito.ArgumentMatchers.*",
              "org.springframework.test.web.servlet.result.MockMvcResultMatchers.*",
              "org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*",
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          codeGeneration = {
            generateComments = true,
            hashCodeEquals = {
              useInstanceof = true,
              useJava7Objects = true,
            },
            toString = {
              codeStyle = "STRING_BUILDER_CHAINED",
            },
            useBlocks = true,
          },
          implementationsCodeLens = "none", -- methods | types | all | none
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
    keys = {
      --stylua: ignore start
      { "<leader>cgb", function() Snacks.terminal.open("gradle build", {interactive = false, win = {border = "rounded"}}) end, desc = "Gradle Build", },
      { "<leader>cgr", function() Snacks.terminal.open("gradle run",{interactive = false, win = {border ="rounded"}}) end, desc = "Gradle Run", },
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
      explorer = { enabled = false },
      image = {},
      statuscolumn = {
        folds = {
          open = true, -- show open fold icons
          git_hl = true, -- use Git Signs hl for fold icons
        },
      },
      picker = {
        sources = {
          explorer = {
            -- layout = { preview = "file", preset = "ivy", layout = { zindex = 45 } }, -- puts explorer below
          },
        },
        win = {
          preview = {
            wo = {
              relativenumber = true,
              signcolumn = "no",
              wrap = false,
            },
          },
        },
      },
    },
    keys = {
      -- stylua: ignore start
      { "<leader>tg", function() Snacks.terminal.toggle("tig") end, desc = "Snacks Terminal Tig", },
      { "<leader>yz", function() Snacks.terminal.toggle("yazi " .. Snacks.git.get_root()) end, desc = "Snacks Terminal Yazi", },
      { "<leader>bt", function() Snacks.terminal.toggle("btop") end, desc = "Snacks Terminal Btop", },
      { "<leader>gC", function() Snacks.terminal.toggle("git commit -v") end, desc = "Git Commit Verbose", },
      { "<leader>sP", function() Snacks.picker() end, desc = "Snacks Pickers", },
      { "<leader>fC", function() Snacks.picker.grep({ dirs = {vim.fn.stdpath('config')} or nil}) end, desc = "Grep Neovim Config files", },
      { "<leader>f,", function() Snacks.picker.grep({ dirs = {vim.fs.normalize('$HOME/.config')}}) end, desc = "Grep Home Config files", },
      { "<leader>f.", function() Snacks.picker.files({ dirs = {vim.fs.normalize('$HOME/.config')}, hidden = true}) end, desc = "Find Home Config files", },
      { "<leader>s.", function() Snacks.picker.smart() end, desc = "Snacks Smart", },
      -- stylua: ignore end
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
      -- TOPICS:
      -- ALGO:
      -- PENDING:
      -- FIX:
      keywords = {
        PENDING = { icon = " ", color = "orange", alt = { "NOTDONE" } },
        REVISION = { icon = " ", color = "hint", alt = { "REVISE" } },
        BOOKMARK = { icon = " ", color = "blue", alt = { "MARK" } },
        TOPICS = { icon = " ", color = "warning", alt = { "ALGO" } },
      },
      colors = {
        orange = { "Special" },
        blue = { "Identifier" },
      },
    },
  },

  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_compiler_method = "tectonic"
    end,
  },
}
