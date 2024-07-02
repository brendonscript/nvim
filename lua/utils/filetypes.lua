local map = require('utils.helpers').map
local augroup = require('utils.helpers').augroup

local M = {}

M.lua = function()
  map({ 'n', 'v' }, '<leader>mr', '<cmd>source %<cr>', { desc = 'Run buffer', buffer = true })
end

M.json = function()
  -- Insert comma on new line
  map('n', 'o', function()
    local line = vim.api.nvim_get_current_line()

    local should_add_comma = string.find(line, '[^,{[]$')
    if should_add_comma then
      return 'A,<cr>'
    else
      return 'o'
    end
  end, { buffer = true, expr = true })
end

M.fish = function()
  vim.opt_local.wrap = true
  vim.opt_local.shiftwidth = 4
  vim.opt_local.tabstop = 4
end

M.gitcommit = function()
  vim.opt_local.wrap = true
  vim.opt_local.spell = true
end

M.org = function()
  -- vim.opt_local.foldexpr = "0"
  vim.opt_local.conceallevel = 2
  vim.opt_local.concealcursor = 'nc'
  vim.opt_local.foldlevel = 1
end

M.markdown = function()
  vim.opt_local.autowriteall = true
  vim.opt_local.autowrite = true
  vim.opt_local.shiftwidth = 4
  vim.opt_local.tabstop = 4
  vim.opt_local.spell = false
  map('n', '<leader>md', '<cmd>.s/-.*]/- [x]<cr><cmd>nohl<cr>', { desc = 'Mark as complete', buffer = true })
  map('n', '<leader>mD', '<cmd> .s/-.*[x]]/- [ ] <cr><cmd>nohl<cr>', { desc = 'Mark as incomplete', buffer = true })
  map('n', '<leader>mt', '<cmd>silent grep! "^\\- \\[ \\]" . | copen<cr>', { desc = 'Find all todos', buffer = true })
  map(
    'n',
    '<leader>mT',
    '<cmd>silent grep! "^\\- \\[ \\]" "%:p" | copen<cr>',
    { desc = 'Find todos in current file', buffer = true }
  )
  -- grep "\- \[ \]" .
end

-- M.gitrebase = function()
--   local opts = { noremap = true, silent = true, buffer = true }
--   map('n', 'cc', 'pick', opts)
--   map('n', 'dd', 'reword', opts)
--   map('n', 'ee', 'edit', opts)
--   map('n', 'ss', 'squash', opts)
--   map('n', 's', 's', opts)
--   map('n', 'ff', 'fixup', opts)
-- end

require('utils.helpers').ft_commands(M)
