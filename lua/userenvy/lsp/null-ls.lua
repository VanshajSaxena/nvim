local vim = vim
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.completion.luasnip,
        require("null-ls").builtins.formatting.clang_format,
		require("null-ls").builtins.diagnostics.clang_check,
		require("null-ls").builtins.diagnostics.zsh,
		require("null-ls").builtins.formatting.beautysh,
		require("null-ls").builtins.formatting.google_java_format,
		require("null-ls").builtins.diagnostics.shellcheck,
    },
})

---@diagnostic disable-next-line: unused-local
local defaults = {
    cmd = { "nvim" },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    diagnostics_format = "[#{c}] #{m} (#{s})",
    fallback_severity = vim.diagnostic.severity.ERROR,
    log_level = "warn",
    notify_format = "[null-ls] %s",
    on_attach = nil,
    on_init = nil,
    on_exit = nil,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
    sources = nil,
    update_in_insert = false,
}
