return {
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'tokyonight',
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = {
      style = 'storm',
      on_colors = function(colors)
        colors.bg_statusline = colors.bg
        -- colors.bg_bufline = colors.bg
        -- colors.fg_bufline = colors.fg
      end,
      on_highlights = function(highlights, _)
        highlights.IlluminatedWordText = {
          bg = 'NONE',
        }
        highlights.IlluminatedWordWrite = {
          bg = 'NONE',
        }
        highlights.IlluminatedWordRead = {
          bg = 'NONE',
        }
        highlights.IlluminatedWordRead = {
          bg = 'NONE',
        }

        highlights.illuminatedCurWord = {
          bg = 'NONE',
        }
        highlights.illuminatedWord = {
          bg = 'NONE',
        }
      end,
    },
  },
  {
    'catppuccin/nvim',
    lazy = true,
    name = 'catppuccin',
    opts = {
      integrations = {
        navic = {
          custom_bg = 'NONE',
          enabled = true,
        },
      },
    },
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = true,
  },
  {
    'rose-pine/neovim',
    lazy = true,
    name = 'rose-pine',
    opts = {},
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
    priority = 1000,
    opts = {
      inverse = false,
    },
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
    },
  },
}
