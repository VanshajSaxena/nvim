if vim.g.neovide then
  vim.g.neovide_opacity = 0.75
  vim.g.neovide_cursor_smooth_blink = false
  vim.o.guifont = "FiraCode Nerd Font:h12"
  vim.o.pumblend = 75 -- Popup blend pumblend has to be set to zero for : completion
  vim.o.winblend = 75 -- Float-windows blend
  vim.env.EDITOR = "neovide"
  vim.g.neovide_fullscreen = true
  vim.g.neovide_cursor_hack = true
end
