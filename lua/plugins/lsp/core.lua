return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gd", false }
    end,
    opts = {
      servers = {
        sourcekit = {
          cmd = vim.tbl_extend("force", {}, vim.loop.os_uname().sysname == "Darwin" and {
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
          } or { "sourcekit-lsp" }),
        },
        nil_ls = {},
        clangd = {},
      },
    },
  },
}
