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
