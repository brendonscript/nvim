return {
  {
    'nvim-neorg/neorg',
    lazy = true,
    version = '*',
    ft = 'norg',
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/Documents/org',
            },
            default_workspace = 'org',
          },
        },
        -- /home/brendon/Documents/org
      },
    },
  },
}
