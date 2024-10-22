return {
  'hrsh7th/nvim-cmp',
  enabled = false,
  dependencies = {
    'hrsh7th/cmp-cmdline',
  },
  keys = {
    -- { '<tab>', false, mode = { 'i', 's' } },
    -- { '<s-tab>', false, mode = { 'i', 's' } },
  },
  opts = function(_, opts)
    local cmp = require('cmp')
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
    opts.completion.completeopt = 'menu,menuone,noinsert,noselect'
    opts.experimental.ghost_text = false
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end
    opts.mapping = vim.tbl_deep_extend('force', opts.mapping, {
      ['<C-d>'] = cmp.mapping(function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end, { 'i', 's' }),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<C-f>'] = cmp.mapping(function()
        cmp.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        })
      end, { 'i', 's' }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          cmp.select_next_item()
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { 'i', 's' }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' },
      }, {
        { name = 'buffer' },
      }),
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
