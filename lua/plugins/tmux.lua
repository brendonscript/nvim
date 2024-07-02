return {
  'aserowy/tmux.nvim',
  lazy = false,
  keys = {
    {
      '<C-h>',
      function()
        require('tmux').move_left()
      end,
      mode = { 'n' },
      desc = 'Move Tmux Left',
    },
    {
      '<C-j>',
      function()
        require('tmux').move_bottom()
      end,
      mode = { 'n' },
      desc = 'Move Tmux Bottom',
    },
    {
      '<C-k>',
      function()
        require('tmux').move_top()
      end,
      mode = { 'n' },
      desc = 'Move Tmux Top',
    },
    {
      '<C-l>',
      function()
        require('tmux').move_right()
      end,
      mode = { 'n' },
      desc = 'Move Tmux Right',
    },
    {
      '<A-h>',
      function()
        require('tmux').resize_left()
      end,
      mode = { 'n' },
      desc = 'Resize Tmux Left',
    },
    {
      '<A-j>',
      function()
        require('tmux').resize_bottom()
      end,
      mode = { 'n' },
      desc = 'Resize Tmux Bottom',
    },
    {
      '<A-k>',
      function()
        require('tmux').resize_top()
      end,
      mode = { 'n' },
      desc = 'Resize Tmux Top',
    },
    {
      '<A-l>',
      function()
        require('tmux').resize_right()
      end,
      mode = { 'n' },
      desc = 'Resize Tmux Right',
    },
  },
  opts = {
    copy_sync = {
      redirect_to_clipboard = true,
    },
    navigation = {
      cycle_navigation = true,
      persist_zoom = true,
    },
  },
}
