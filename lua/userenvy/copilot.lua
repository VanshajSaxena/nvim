local vim = vim
vim.cmd(' let g:copilot_node_command = "~/.nvm/versions/node/v12.17.0/bin/node"')
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_no_default_key_mappings = true
vim.g.auto_copilot = 1

vim.keymap.set('i', '<M-.>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-,>', '<Plug>(copilot-previous)')

-- write a function to toggle copilot accetping input

vim.cmd('inoremap <silent><expr> <C-J> copilot#Accept("")')




