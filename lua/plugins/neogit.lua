return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gG', '<cmd>Neogit<cr>', desc = 'Neogit' },
  },
  opts = {
    integrations = {
      fzf_lua = true,
      diffview = true,
    },
  },
}
