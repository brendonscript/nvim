return {
  {
    'nvim-neorg/neorg',
    enabled = false,
    lazy = false,
    version = '*',
    ft = 'norg',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/Documents/org',
            },
            default_workspace = 'notes',
          },
        },
      },
    },
  },
}
