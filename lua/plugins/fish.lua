return {
  {
    'mtoohey31/cmp-fish',
    enabled = true,
    ft = 'fish',
    dependencies = {
      {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
          table.insert(opts.sources, { name = 'fish' })
        end,
      },
    },
  },
  -- {
  --   'ndonfris/fish-lsp',
  --   lazy = false,
  --   dependencies = {
  --   'neovim/nvim-lspconfig',
  --   }
  --   enabled = true,
  --   config = function()
  --     l
  --   end
  -- },
  -- {
  --   'neovim/nvim-lspconfig',
  --   optional = true,
  --   ---@class PluginLspOpts
  --   opts = {
  --     servers = {
  --       fish_lsp = {
  --         mason = false,
  --         filetypes = {
  --           'fish',
  --         },
  --         -- settings = {
  --         --
  --         -- }
  --       },
  --     },
  --   },
  -- },
}
