
local stdpath_data = vim.fn.stdpath('data')
--print(vim.fn.stdpath('data')) = /home/ArchEnvy/.local/share/nvim/mason/packages/jdtls/bin/
local jdtls_path = vim.fn.expand(stdpath_data .. '/mason/packages/jdtls/')
local root_dir = require('jdtls.setup').find_root({ 'gradlew' })
local workspace_dir = stdpath_data .. '/eclipse-workspace-dir/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
--extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local bundles = {
	vim.fn.glob(stdpath_data ..
		'/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'),
}

vim.list_extend(bundles,
	vim.split(
		vim.fn.glob(stdpath_data .. '/mason/packages/java-test/extension/server/*.jar'),
		'\n'))
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		-- 💀
		'java', -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-javaagent:' .. stdpath_data .. '/mason/packages/jdtls/lombok.jar',
		'-Xms1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens',
		'java.base/java.util=ALL-UNNAMED',
		'--add-opens',
		'java.base/java.lang=ALL-UNNAMED',

		-- 💀
		'-jar',
		vim.fn.glob(stdpath_data ..
			'/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		'-configuration', jdtls_path .. 'config_linux/',
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		'-data', workspace_dir
	},
	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = root_dir,
	capabilities = capabilities,
	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			autobuild = { enabled = true, },
			signatureHelp = { enabled = true },
			format = {
				enabled = true,
			},
			completion = {
				favoriteStaticMembers = {
					'org.junit.jupiter.Assertions.*',
				}
			},
			configuration = {
				runtime = {
					{
						name = 'JavaSE-17',
						path = os.getenv('JDK17')
					}
				}
			}
		}
	},
	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = bundles,
		--extendedClientCapabilities = extendedClientCapabilities
	},
	--	enable_format_on_save(),
}
require('jdtls').start_or_attach(config)
