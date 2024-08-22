---@type LazySpec
return {
  {
    'mikavilpas/yazi.nvim',
    lazy = false,
    keys = {
      {
        '<leader>Ff',
        function()
          require('yazi').yazi()
        end,
        desc = 'Open the file manager',
      },
      {
        -- Open in the current working directory
        '<leader>FF',
        function()
          require('yazi').yazi(nil, vim.fn.getcwd())
        end,
        desc = 'Open Yazi in CWD',
      },
      {
        '<leader>Ft',
        function()
          -- NOTE: requires a version of yazi that includes
          -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
          require('yazi').toggle()
        end,
        desc = 'Resume the last yazi session',
      },
      {
        '<leader>Y',
        function()
          require('yazi').yazi()
        end,
        desc = 'Yazi',
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,

      -- enable these if you are using the latest version of yazi
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,

      keymaps = {
        show_help = '<f1>',
      },
    },
    config = function(_, opts)
      require('yazi').setup(opts)
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    optional = true,
    opts = {
      filesystem = {
        hijack_netrw_behavior = 'disabled',
      },
    },
  },
}
