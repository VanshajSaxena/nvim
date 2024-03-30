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
          cmd = function()
            if true then --TODO: need to add check for macos
              return {
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
            end
          end,
        },
        nil_ls = {},
        clangd = {},
      },
    },
  },
}
