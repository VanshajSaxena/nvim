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

if os.getenv("OS") == "Windows_NT" then
  vim.cmd([[ let g:clipboard = {
\ 'name': 'win32yank',
\ 'copy': {
\    '+': 'win32yank.exe -i --crlf',
\    '*': 'win32yank.exe -i --crlf',
\  },
\ 'paste': {
\    '+': 'win32yank.exe -o --lf',
\    '*': 'win32yank.exe -o --lf',
\ },
\ 'cache_enabled': 0,
\ }
]])
  vim.o.shell = "powershell.exe"
  vim.o.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""

  -- Get the user's home directory
  local home = os.getenv("USERPROFILE") or os.getenv("HOME")

  -- Construct the Scoop shims path
  local scoop_shims_path = home .. "\\scoop\\shims"
  vim.env.PATH = scoop_shims_path .. ";" .. vim.env.PATH
end

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
