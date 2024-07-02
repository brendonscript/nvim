-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')
require('utils')

if vim.g.neovide then
  require('utils.neovide')
end
