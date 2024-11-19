local keymap = vim.keymap.set

vim.keymap.del("n", "<leader>l")
vim.keymap.del({ "n", "i", "x" }, "<C-s>")

keymap("", "<leader>lp", "<cmd>Lazy<cr>", { desc = "Lazy Profile" })
keymap("n", "<leader>lE", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })

keymap("i", "<C-l>", "<right>", { desc = "move right in insert mode" })
keymap("i", "<C-j>", "<down>", { desc = "move down in insert mode" })

keymap("n", "<leader>Cd", "<cmd>Copilot disable<cr>", { desc = "Disable Copilot" })

-- stylua: ignore start
keymap( "n", "<leader>sn", "<cmd>vertical sbnext<cr>", { desc = "split window in two and edit alternate file (vertical)" })
keymap("n", "\\nj", "<cmd>Neorg journal today<cr>", { desc = "[neorg] Journal Today" })
-- stylua: ignore end

---[[
if os.getenv("TERM_PROGRAM") == "tmux" then
  local openfloat = function(program, title, map, desc, silent)
    -- stylua: ignore
    keymap( "n", "<leader>" .. map, ":silent !tmux display-popup -T " .. title .. " -d '\\#{pane_current_path}' -w80\\% -h80\\% -b rounded -E " .. program .. "<cr>", { desc = desc, silent = silent })
  end
  -- openfloat("lazygit", '"   "', "gg", "tmux open-float lazygit", true)
  openfloat("", '"   "', ">", "tmux open-float term", true)
  openfloat("tig", '" tig "', "ti", "tmux open-float tig", true)
  openfloat("htop", '" htop "', "H", "tmux open-float htop", true)
  openfloat("btop", '" btop "', "B", "tmux open-float btop", true)
elseif os.getenv("OS") == "Windows_NT" then
  local openfloat = function(program, map, desc, silent)
    keymap("n", "<leader>" .. map, "<cmd>Lspsaga term_toggle " .. program .. "<cr>", { desc = desc, silent = silent })
  end
  -- openfloat("lazygit", "gg", "Lspsaga term_toggle lazygit", true)
  openfloat("pwsh", ">", "Lspsaga term_toggle", true)
end
--]]
