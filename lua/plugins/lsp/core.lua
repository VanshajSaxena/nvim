return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gd", false }
    end,
    opts = {
      codelens = {
        enabled = true,
      },
      servers = {
        sourcekit = {
          cmd = vim.uv.os_uname().sysname == "Darwin"
              and {
                "sourcekit-lsp",
                "-Xswiftc",
                "-sdk",
                "-Xswiftc",
                "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk",
                "-Xswiftc",
                "-target",
                "-Xswiftc",
                "arm64-apple-ios15.0-simulator",
                "-Xcc",
                "-DSWIFT_PACKAGE=0",
              }
            or { "sourcekit-lsp" },
        },
        clangd = { mason = not Termux },
        groovyls = {
          mason = false,
        },
        gradle_ls = {},
        lemminx = {},
        lua_ls = {
          mason = not Termux,
          settings = {
            Lua = {
              codeLens = {
                enable = false,
              },
              hint = {
                setType = true,
                paramName = "Enable",
                arrayIndex = "Enable",
              },
            },
          },
        },
        nixd = {
          mason = false,
          settings = {
            formatting = {
              command = { "nixfmt" },
            },
          },
        },
        vacuum = {
          cmd = {
            "vacuum",
            "language-server",
            -- "--hard-mode"
          },
          filetypes = { "yaml.openapi", "json.openapi" },
        },
        spectral = {
          mason = false,
          filetypes = { "yaml.openapi", "json.openapi" },
        },
        jsonls = {
          filetypes = { "json", "json.openapi" },
        },
        yamlls = {
          filetypes = { "yaml", "yaml.openapi" },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                diagnosticMode = "workspace", -- "openFilesOnly"
                -- exclude = { "**/venv", "**/.*venv" }, -- This would match any 'venv' or '.venv' directory anywhere
                ignore = { "**/venv", "**/.*venv" },
                inlayHints = {
                  genericTypes = true,
                },
              },
            },
          },
        },
      },
    },
  },

  {
    "xbase-lab/xbase",
    cond = vim.uv.os_uname().sysname == "Darwin" and true or false,
    ft = "swift",
    build = "make install", -- or "make install && make free_space" (not recommended, longer build time)
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("xbase").setup({})
    end,
  },
}
