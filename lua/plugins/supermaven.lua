return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'supermaven-inc/supermaven-nvim',
    opts = {
      disable_keymaps = true,
      disable_inline_completion = true,
      log_level = 'off',
    },
  },
  opts = function(_, opts)
    table.insert(opts.sources, 3, {
      name = 'supermaven',
      group_index = 1,
    })
  end,
}
