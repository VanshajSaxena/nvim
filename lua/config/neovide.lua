if vim.g.neovide then
  vim.g.neovide_opacity = 0.85
  vim.g.neovide_cursor_smooth_blink = false
  vim.o.guifont = "Maple Mono NF:h11"
  vim.o.pumblend = 75 -- Popup blend pumblend has to be set to zero for : completion
  vim.o.winblend = 75 -- Float-windows blend
  vim.env.EDITOR = "neovide"
  vim.g.neovide_fullscreen = true
  vim.g.neovide_cursor_hack = true
  -- Paste from clipboard in Normal, Visual, and Command modes
  vim.keymap.set({ "n", "v", "s", "x", "o" }, "<C-S-V>", '"+gP', { desc = "Paste from system clipboard" })
  -- Paste from clipboard in Insert and Terminal modes
  vim.keymap.set({ "i", "c" }, "<C-S-V>", "<C-R>+", { desc = "Paste from system clipboard" })
  vim.keymap.set("t", "<C-S-V>", [[<C-\><C-n>"+gPi]], { desc = "Paste from system clipboard" })
end
