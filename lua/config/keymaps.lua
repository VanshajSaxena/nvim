-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
vim.keymap.del("n", "<leader>l")
keymap("", "<leader>lp", "<cmd>Lazy<cr>", { desc = "Lazy Profile" })
keymap("", "<leader>lh", "<cmd>Lazy home<cr>", { desc = "Lazy Home" })
keymap("i", "<C-l>", "<right>", { desc = "move right in insert mode" })
-- stylua: ignore start
keymap( "n", "<leader>sn", "<cmd>vertical sbnext<cr>", { desc = "split window in two and edit alternate file (vertical)" })
keymap( "n", "<leader>sl", "<cmd> lua require('telescope.builtin').find_files({cwd = vim.fn.expand('$HOME/.local/share/nvim/lazy/LazyVim')})<cr>", { desc = "Find Files LazyVim" })
keymap( "n", "<leader>sL", "<cmd> lua require('telescope.builtin').live_grep({cwd = vim.fn.expand('$HOME/.local/share/nvim/lazy/LazyVim')})<cr>", { desc = "Grep LazyVim" })
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
