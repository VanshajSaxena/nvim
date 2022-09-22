local vim = vim
require("notify").setup({
		background_colour = "#000000",
		fps = 50,
		stages = "fade",
		timeout = 500,
		top_right = false,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
		},
	})
vim.notify = require("notify")
--vim.notify("Entered", vim.log.levels.INFO, { title = "Neovim" })

local async = require("plenary.async")
---@diagnostic disable-next-line: unused-local
local notify = require("notify").async

async.run(function()
--  notify("Let's wait for this to close").events.close()
--  notify("It closed!")
end)
