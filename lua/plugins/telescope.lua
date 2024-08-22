return {
  'nvim-telescope/telescope.nvim',
  optional = true,
  opts = function(_, opts)
    local actions = require('telescope.actions')
    opts.defaults.mappings.i = vim.tbl_deep_extend('force', opts.defaults.mappings.i, {
      ['<C-j>'] = {
        actions.move_selection_next,
        type = 'action',
        opts = { nowait = true, silent = true },
      },
      ['<C-k>'] = {
        actions.move_selection_previous,
        type = 'action',
        opts = { nowait = true, silent = true },
      },
    })
    return opts
  end,
}
