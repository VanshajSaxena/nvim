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
          -- stylua: ignore
          ---@diagnostic disable-next-line: undefined-field
          cmd = vim.loop.os_uname().sysname == "Darwin"
              and { "sourcekit-lsp",
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
        nixd = { mason = false },
        clangd = { mason = not Termux },
        lua_ls = { mason = not Termux },
        groovyls = {},
      },
    },
  },

  {
    "xbase-lab/xbase",
    ---@diagnostic disable-next-line: undefined-field
    cond = vim.loop.os_uname().sysname == "Darwin" and true or false,
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
