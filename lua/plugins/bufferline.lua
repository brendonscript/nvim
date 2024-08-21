return {
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'folke/tokyonight.nvim',
      {
        'tiagovla/scope.nvim',
        opts = {},
      },
    },
    keys = {
      { '<M-n>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '<M-p>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { 'gb', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { 'gB', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    },
    opts = function(_, opts)
      local groups = require('bufferline.groups')
      opts.options = {
        mode = 'tabs',
        sort_by = 'extension',
        themable = true,
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- enforce_regular_tabs = true,
        show_duplicate_prefix = true,
        separator_style = {},
        -- groups = {
        --   options = {
        --     toggle_hidden_on_enter = true,
        --   },
        --   items = {
        --     {
        --       name = 'Code',
        --       auto_close = false,
        --       matcher = function(buf)
        --         return buf.name:match('%.lua') or buf.name:match('%.cs')
        --       end,
        --       separator = {
        --         style = require('bufferline.groups').separator.tab,
        --       },
        --     },
        --     {
        --       name = 'Typescript',
        --       auto_close = false,
        --       matcher = function(buf)
        --         return buf.name:match('%.ts') or buf.name:match('%.tsx')
        --       end,
        --       separator = {
        --         style = require('bufferline.groups').separator.tab,
        --       },
        --     },
        --     {
        --       name = 'HTML',
        --       auto_close = false,
        --       matcher = function(buf)
        --         return buf.name:match('%.html')
        --       end,
        --       separator = {
        --         style = require('bufferline.groups').separator.tab,
        --       },
        --     },
        --     {
        --       name = 'CSS',
        --       auto_close = false,
        --       matcher = function(buf)
        --         return buf.name:match('%.css') or buf.name:match('%.scss') or buf.name:match('%.sass')
        --       end,
        --       separator = {
        --         style = require('bufferline.groups').separator.tab,
        --       },
        --     },
        --     {
        --       name = 'Config',
        --       auto_close = true,
        --       matcher = function(buf)
        --         return buf.name:match('%.json')
        --           or buf.name:match('%.toml')
        --           or buf.name:match('%.yaml')
        --           or buf.name:match('%.yml')
        --       end,
        --       separator = {
        --         style = require('bufferline.groups').separator.tab,
        --       },
        --     },
        --     {
        --       name = 'Tests', -- Mandatory
        --       highlight = { underline = true },
        --       -- priority = 2, -- determines where it will appear relative to other groups (Optional)
        --       matcher = function(buf) -- Mandatory
        --         return buf.name:match('%_test') or buf.name:match('%_spec')
        --       end,
        --     },
        --     {
        --       name = 'Docs',
        --       auto_close = true,
        --       matcher = function(buf)
        --         return buf.name:match('%.md') or buf.name:match('%.txt')
        --       end,
        --       separator = {
        --         style = require('bufferline.groups').separator.tab,
        --       },
        --     },
        --   },
        --   groups.builtin.ungrouped,
        -- },
      }

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
}
