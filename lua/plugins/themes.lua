return {
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'catppuccin-mocha',
    },
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'catppuccin' },
    opts = function(_, opts)
      local mocha = require('catppuccin.palettes').get_palette('mocha')
      local macchiato = require('catppuccin.palettes').get_palette('macchiato')
      opts.highlights = require('catppuccin.groups.integrations.bufferline').get({
        styles = { 'italic', 'bold' },
        custom = {
          mocha = {
            background = {
              bg = mocha.base,
              fg = mocha.subtext0,
            },
            fill = { bg = mocha.base },
            buffer_selected = {
              bg = mocha.base,
              fg = mocha.text,
            },
          },
        },
      })
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = true,
    dependencies = {
      'akinsho/bufferline.nvim',
      opts = function(_, opts)
        local colors = require('tokyonight.colors').setup()
        opts.highlights = {
          buffer_selected = {
            bg = colors.bg,
            fg = colors.cyan,
            bold = true,
            italic = true,
          },
          buffer_visible = {
            bg = colors.bg,
            fg = colors.blue,
            bold = false,
            italic = false,
          },
          buffer = {
            bg = colors.bg_highlight,
            fg = colors.fg,
          },
          fill = {
            bg = colors.bg_highlight,
          },
          background = {
            bg = colors.bg_highlight,
            -- fg = colors.blue1,
          },
          -- separator = {
          --   bg = colors.bg_highlight,
          --   fg = colors.bg_highlight,
          -- },
          -- separator_visible = {
          --   bg = colors.bg_highlight,
          --   fg = colors.bg_highlight,
          -- },
          -- separator_selected = {
          --   bg = colors.bg_highlight,
          --   fg = colors.bg_highlight,
          -- },
          -- offset_separator = {
          --   bg = colors.yellow,
          --   fg = colors.yellow,
          -- },
          -- tab_separator = {
          --   fg = colors.yellow,
          --   bg = colors.yellow,
          -- },
          duplicate_visible = {
            fg = 'white',
            bg = colors.red,
            italic = true,
          },
          duplicate = {
            fg = 'white',
            bg = colors.red,
            italic = true,
          },
          duplicate_selected = {
            fg = 'white',
            bg = colors.red,
            italic = true,
          },
          trunc_marker = {
            bg = colors.bg,
            fg = colors.fg,
          },
          modified = {
            bg = colors.bg_highlight,
          },
        }
      end,
    },
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
    -- config = function(_, opts)
    --   require('tokyonight').setup(opts)
    --   vim.cmd([[colorscheme tokyonight]])
    -- end,
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
