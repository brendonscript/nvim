return {
  'mfussenegger/nvim-lint',
  opts = {
    linters_by_ft = {
      markdown = {},
    },
  },
  -- opts = {
  --   linters = {
  --     markdownlint = {
  --       args = { '--config', '~/.markdownlint.yaml', '--' },
  --       condition = function(ctx)
  --         return vim.fs.find({ '.markdownlint.yaml' }, { path = ctx.filename, upward = true })
  --       end,
  --     },
  --   },
  -- },
}
