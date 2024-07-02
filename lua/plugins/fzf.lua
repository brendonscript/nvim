return {
  'ibhagwan/fzf-lua',
  optional = true,
  opts = function(_, opts)
    opts.winopts = vim.tbl_deep_extend('force', opts.winopts or {}, {
      layout = 'flex',
    })
  end,
}
