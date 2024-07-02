return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  enabled = false,
  opts = {},
  keys = {
    {
      '<C-h>',
      function()
        require('smart-splits').move_cursor_left()
      end,
      mode = { 'n' },
      desc = 'Move Left',
    },
    {
      '<C-l>',
      function()
        require('smart-splits').move_cursor_right()
      end,
      mode = { 'n' },
      desc = 'Move Right',
    },
    {
      '<C-j>',
      function()
        require('smart-splits').move_cursor_down()
      end,
      mode = { 'n' },
      desc = 'Move Down',
    },
    {
      '<C-k>',
      function()
        require('smart-splits').move_cursor_up()
      end,
      mode = { 'n' },
      desc = 'Move Up',
    },
    {
      '<A-h>',
      function()
        require('smart-splits').resize_left()
      end,
      mode = { 'n' },
      desc = 'Resize Left',
    },
    {
      '<A-l>',
      function()
        require('smart-splits').resize_right()
      end,
      mode = { 'n' },
      desc = 'Resize Right',
    },
    {
      '<A-j>',
      function()
        require('smart-splits').resize_down()
      end,
      mode = { 'n' },
      desc = 'Resize Down',
    },
    {
      '<A-k>',
      function()
        require('smart-splits').resize_up()
      end,
      mode = { 'n' },
      desc = 'Resize Up',
    },
  },
}
