return {
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'tiagovla/scope.nvim',
      opts = {},
    },
    keys = {
      { '<M-n>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '<M-p>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { 'gb', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { 'gB', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    },
    opts = {
      options = {
        mode = 'tabs',
        sort_by = 'extension',
        themable = true,
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- enforce_regular_tabs = true,
        show_duplicate_prefix = true,
        separator_style = {},
      },
    },
  },
}
