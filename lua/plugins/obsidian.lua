-- TODO: Configure
return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  enabled = false,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    'BufReadPre ~/Documents/Notes/*.md',
    'BufNewFile ~/Documents/Notes/*.md',
    'BufReadPre /mnt/c/Users/Brendon/Documents/Notes/*.md',
    'BufNewFile /mnt/c/Users/Brendon/Documents/Notes/*.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies ??
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
      {
        name = 'work',
        path = '~/vaults/work',
      },
    },

    -- see below for full list of options ??
  },
}
