if vim.g.neovide then
  vim.g.neovide_opacity = 1
  vim.g.neovide_cursor_smooth_blink = false
  vim.g.neovide_fullscreen = true
  vim.o.guifont = "FiraCode Nerd Font:h11"
  set.pumblend = 0 -- Popup blend pumblend has to be set to zero for : completion
  set.winblend = 0 -- Float-windows blend
end
