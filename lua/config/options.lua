Termux = os.getenv("TERMUX_VERSION") ~= nil

local set = vim.opt

vim.g.snacks_scroll = false

set.confirm = false
set.hidden = true
set.inccommand = "split"
set.hlsearch = false
set.mouse = "nv"
set.pumblend = 0 -- popup blend pumblend has to be set to zero for : completion
set.winblend = 0 -- float-windows blend
set.pumheight = 20 -- later to update
set.scroll = 10 -- scroll for CTRL-D and CTRL-U
set.scrolloff = 16
set.sidescrolloff = 48

if vim.g.neovide then
  vim.g.neovide_opacity = 1
  vim.g.neovide_cursor_smooth_blink = false
  vim.g.neovide_fullscreen = true
  vim.o.guifont = "FiraCode Nerd Font:h11"
  set.pumblend = 0 -- Popup blend pumblend has to be set to zero for : completion
  set.winblend = 0 -- Float-windows blend
end

-- OpenAPI filetype
vim.filetype.add({
  pattern = {
    ["openapi.*%.ya?ml"] = "yaml.openapi",
    ["openapi.*%.json"] = "json.openapi",
  },
})
