-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local utils = require('utils.helpers')
local opt = vim.opt
vim.g.root_spec = { 'cwd' }

opt.wrap = true
opt.spell = false
-- opt.laststatus = 3

-- if utils.is_mac() or utils.is_linux() then
--   -- opt.shell = '/bin/sh'
--   local shell = os.getenv('SHELL') or '/bin/sh'
--   ---@diagnostic disable-next-line: assign-type-mismatch
--   opt.shell = shell
-- end

-- if vim.g.neovide then
--   require('utils.neovide')
-- end

if utils.is_wsl() then
  vim.api.nvim_set_var('clipboard', {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  })
end
