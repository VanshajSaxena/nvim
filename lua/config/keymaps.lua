-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--[[
local keymap = vim.keymap.set
keymap("", "<Space>", "<Nop>", { desc = "nop" })

if os.getenv("TERM_PROGRAM") == "tmux" then
  local openfloat = function(program, title, map, desc, silent)
    keymap(
      "n",
      "<leader>" .. map,
      ":silent !tmux display-popup -T "
        .. title
        .. " -d '\\#{pane_current_path}' -w80\\% -h80\\% -b rounded -E "
        .. program
        .. "<cr>",
      { desc = desc, silent = silent }
    )
  end
  openfloat("lazygit", '"   "', "gg", "tmux open-float lazygit", true)
  openfloat("", '"   "', ">", "tmux open-float term", true)
  openfloat("tig", '" tig "', "ti", "tmux open-float tig", true)
  openfloat("htop", '" htop "', "H", "tmux open-float htop", true)
  openfloat("btop", '" btop "', "B", "tmux open-float btop", true)
elseif os.getenv("OS") == "Windows_NT" then
  local openfloat = function(program, map, desc, silent)
    keymap("n", "<leader>" .. map, "<cmd>Lspsaga term_toggle " .. program .. "<cr>", { desc = desc, silent = silent })
  end
  openfloat("lazygit", "gg", "Lspsaga term_toggle lazygit", true)
  openfloat("pwsh", ">", "Lspsaga term_toggle", true)
end

]]
