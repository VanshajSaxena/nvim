local stdpath_data = vim.fn.stdpath('data')
--print(vim.fn.stdpath('data')) = /home/ArchEnvy/.local/share/nvim
local jdtls_path = vim.fn.expand(stdpath_data .. '/mason/packages/jdtls/')
local root_dir = require('jdtls.setup').find_root({ 'gradlew' })
local workspace_dir = stdpath_data .. '/eclipse-workspace-dir/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

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
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
				parameterTypes = {
					enabled = "all",
				},
				varargArguments = {
					enabled = "all",
				},
				varargParameters = {
					enabled = "all",
				},
				hints = {
					enabled = "all",
					onlyForLiterals = false,
					onlyWhenOverlapping = false,
					maxLength = 30,
				},
			},
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
		extendedClientCapabilities = extendedClientCapabilities
	},
	--	enable_format_on_save(),
}

config['on_attach'] = function()
	vim.keymap.set('n', '<leader>tc', function() require('jdtls').test_class() end, { desc = 'jdtls test class' })
	vim.keymap.set('n', '<leader>tm', function() require('jdtls').test_nearest_method() end,
		{ desc = 'jdtls nearest method' })
	vim.keymap.set('n', '<A-o>', function() require('jdtls').organize_imports() end, { desc = 'jdtls organize imports' })
	vim.keymap.set('n', '<leader>ev', function() require('jdtls').extract_variable() end,
		{ desc = 'jdtls extract variable' })
	vim.keymap.set('n', '<leader>em', function() require('jdtls').extract_method() end, { desc = 'jdtls extract method' })
	vim.keymap.set('n', '<leader>eV', function() require('jdtls').extract_variable_all() end,
		{ desc = 'jdtls extract variable all' })
	vim.keymap.set('n', '<leader>ec', function() require('jdtls').extract_constant() end,
		{ desc = 'jdtls extract constant' })

	local dap = require('dap')
	--local dapui = require('dapui')

	--dap.listeners.after.event_initialized['dapui_config'] = function()
	--dapui.open()
	--end
	--dap.listeners.before.event_terminated['dapui_config'] = function()
	--dapui.close()
	--end
	--dap.listeners.before.event_exited['dapui_config'] = function()
	--dapui.close()
	--end

	function Attach_to_debug()
		dap.configurations.java = {
			{
				type = 'java',
				request = 'attach',
				name = 'Attach to the process',
				hostName = 'localhost',
				port = '5005',
			},
		}
		dap.continue()
	end

	-- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
	-- you make during a debug session immediately.
	-- Remove the option if you do not want that.
	-- You can use the `JdtHotcodeReplace` command to trigger it manually
	require('jdtls').setup_dap({ hotcodereplace = 'auto' })
	require('jdtls.dap').setup_dap_main_class_configs()
end

require('jdtls').start_or_attach(config)
