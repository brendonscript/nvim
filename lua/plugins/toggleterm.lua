return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = { 'ToggleTerm' },
    keys = {
      { '<C-t>', '<C-t>', desc = 'Toggle Term' },
      { '<leader>Tt', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Toggle Term Split' },
      { '<leader>TT', '<cmd>ToggleTerm direction=tab<cr>', desc = 'Toggle Term Tab' },
    },
    opts = {
      open_mapping = [[<C-t>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      -- shell = function()
      --   return os.getenv('SHELL')
      --   -- if utils.is_mac then
      --   --   return '/opt/homebrew/bin/zsh'
      --   -- elseif utils.is_linux then
      --   --   if utils.file_exists('/usr/bin/zsh') then
      --   --     return '/usr/bin/zsh'
      --   --   elseif utils.file_exists('/bin/zsh') then
      --   --     return '/bin/zsh'
      --   --   elseif utils.file_exists('/usr/bin/bash') then
      --   --     return '/usr/bin/bash'
      --   --   end
      --   -- elseif utils.is_windows then
      --   --   return ''
      --   -- end
      -- end,
      autochdir = false,
      direction = 'horizontal',
      persist_size = true,
      persist_mode = false,
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'rounded', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- width = <value>,
        -- height = <value>,
        winblend = 3,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    },
  },
  {
    'willothy/flatten.nvim',
    lazy = false,
    priority = 1001,
    opts = {
      window = {
        open = 'alternate',
      },
      callbacks = {
        should_block = function(argv)
          -- Note that argv contains all the parts of the CLI command, including
          -- Neovim's path, commands, options and files.
          -- See: :help v:argv

          -- In this case, we would block if we find the `-b` flag
          -- This allows you to use `nvim -b file1` instead of `nvim --cmd 'let g:flatten_wait=1' file1`
          return vim.tbl_contains(argv, '-b')

          -- Alternatively, we can block if we find the diff-mode option
          -- return vim.tbl_contains(argv, "-d")
        end,
        post_open = function(bufnr, winnr, ft, is_blocking)
          if is_blocking then
            -- Hide the terminal while it's blocking
            require('toggleterm').toggle(0)
          else
            -- If it's a normal file, just switch to its window
            vim.api.nvim_set_current_win(winnr)
          end

          -- If the file is a git commit, create one-shot autocmd to delete its buffer on write
          -- If you just want the toggleable terminal integration, ignore this bit
          if ft == 'gitcommit' then
            vim.api.nvim_create_autocmd('BufWritePost', {
              buffer = bufnr,
              once = true,
              callback = function()
                -- This is a bit of a hack, but if you run bufdelete immediately
                -- the shell can occasionally freeze
                vim.defer_fn(function()
                  vim.api.nvim_buf_delete(bufnr, {})
                end, 50)
              end,
            })
          end
        end,
        block_end = function()
          -- After blocking ends (for a git commit, etc), reopen the terminal
          require('toggleterm').toggle(0)
        end,
      },
    },
  },
  {
    'chomosuke/term-edit.nvim',
    ft = 'toggleterm',
    version = '1.*',
    opts = {
      -- For most bash/zsh user this is '%$ '.
      -- For most powershell/fish user this is '> '.
      -- For most windows cmd user this is '>'.
      prompt_end = '> ',
    },
  },
}
