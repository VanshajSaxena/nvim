vim.opt.formatoptions = vim.opt.formatoptions - "o" - "r" - "c"
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local	capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', '/home/userenvy/.cache/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

    '-configuration', '/home/userenvy/.cache/jdt-language-server-1.9.0-202203031534/config_linux/',

    '-data', vim.fn.stdpath('data') .. '/workspace/' .. workspace_dir,
  },

  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  capabilities = capabilities,
  settings = {
    java = {
    }
  },
  init_options = {
    bundles = {}
  },
}

require('jdtls').start_or_attach(config)

local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("n", "A-o", "<cmd>lua require'jdtls'.organise_imports()<CR>", opts)
keymap("n", "crv", "<cmd>lua require'jdtls'.extract_variable()<CR>", opts)
keymap("v", "crv", "<Esc><cmd>lua require'jdtls'.extract_variable(true)<CR>", opts)
keymap("n", "crc", "<cmd>lua require 'jdtls'.extract_constant()<CR>", opts)
keymap("v", "crc", "<Esc><cmd>lua require 'jdtls'.extract_constant(true)<CR>", opts)
keymap("v", "crm", "<Esc><cmd>lua require 'jdtls'.extract_method(true)<CR>", opts)
--======================Requires NvimDap===============================
keymap("n", "<leader>df", "<cmd>lua require'jdtls'.test_class()<CR>", opts)
keymap("n", "<leader>dn", "<cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
