-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = require('utils.helpers').map

-- Escape --
map('i', 'jk', '<ESC>')

-- Movement --

map('n', 'H', '^')
map('v', 'H', '^')
map('n', 'L', '$')
map('v', 'L', '$')

map('i', '<C-l>', '<ESC>A')
map('i', '<C-h>', '<ESC>I')

map('n', 'gj', 'j')
map('n', 'gk', 'k')

-- Edit --

map('n', '<C-b>', '<C-a>', { desc = 'Increment number' })
map('i', '<C-d>', '<Del>')
vim.keymap.set({ 'n', 'v', 'o', 'x' }, 'M', '%', { remap = true, silent = true })

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- paste over currently selected text without yanking it
map('v', 'gp', '"_dp')
map('v', 'gP', '"_dP')

-- Buffers --

-- Files --

map('n', '<leader>fs', '<cmd>w<cr>', { desc = 'Save File' })

-- Windows --

map('n', '<leader>ux', '<cmd>lua require("utils.helpers").close_floats()<cr>', { desc = 'Close floating windows' })

-- Tabs --

map('n', '<C-w>t', '<cmd>tabnew<cr>', { desc = 'New Tab' })
map('n', '<C-w><C-t>', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
map('n', '<leader><tab>>', '<cmd>+tabmove<cr>', { desc = 'Move Tab Left' })
map('n', '<leader><tab><', '<cmd>-tabmove<cr>', { desc = 'Move Tab Right' })
map('n', '<leader><tab><tab>', '<C-w>g<tab>', { desc = 'Previous Tab' })
map('n', '<leader><tab>c', '<cmd>tabnew<cr>', { desc = 'New Tab' })

-- Utils --

-- Don't yank empty lines into register
map('n', 'dd', function()
  if vim.api.nvim_get_current_line():match('^%s*$') then
    return '"_dd'
  else
    return 'dd'
  end
end, { desc = 'Delete Line', expr = true })

-- Indent with i on empty lines
map('n', 'i', function()
  if #vim.fn.getline('.') == 0 then
    return [["_cc]]
  else
    return 'i'
  end
end, { desc = 'Insert', expr = true })

-- Indent with a on empty lines
map('n', 'a', function()
  if #vim.fn.getline('.') == 0 then
    return [["_cc]]
  else
    return 'a'
  end
end, { desc = 'Append', expr = true })

map('n', '<leader>bY', '<cmd>let @+=expand("%:p")<cr>', { desc = 'Copy current file path' })

map('n', 'g<C-p>', 'o<ESC>p')

map('n', '<leader>g<C-g>', function()
  LazyVim.lazygit()
end, { desc = 'Lazygit (cwd)' })
