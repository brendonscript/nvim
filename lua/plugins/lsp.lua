return {
  {
    'neovim/nvim-lspconfig',
    opts = function()
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or 'single'
        opts.max_width = opts.max_width or 40
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end
      local keys = require('lazyvim.plugins.lsp.keymaps').get()
      keys[#keys + 1] = { 'gl', vim.diagnostic.open_float, desc = 'Line Diagnostics' }
      keys[#keys + 1] = { 'ga', vim.lsp.buf.code_action, desc = 'Code Actions' }
      keys[#keys + 1] = { 'gt', false }
      -- keys[#keys + 1] = { 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'Hover' }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        pyright = {},
        tailwindcss = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Disable',
              },
            },
          },
        },
        angularls = {},
        yamlls = {
          settings = {
            yaml = {
              schemas = require('schemastore').yaml.schemas(),
            },
          },
        },
        html = {},
        cssls = {
          settings = {
            scss = {
              validate = false,
              lint = {
                unknownAtRules = 'ignore',
              },
            },
            css = {
              lint = {
                unknownAtRules = 'ignore',
              },
            },
          },
        },
        marksman = {},
      },
    },
  },
}
