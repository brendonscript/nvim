return {
  'folke/noice.nvim',
  enabled = false,
  opts = {
    routes = {
      {
        filter = { event = 'msg_show', kind = 'search_count' },
        opts = { skip = true },
      },
      {
        filter = { find = 'No information available' },
        opts = { skip = true },
      },
      {
        filter = { find = 'No name available for anonymous functions' },
        opts = { skip = true },
      },
    },
    presets = {
      lsp_doc_border = true,
    },
    popupmenu = {
      enabled = true,
      backend = 'cmp',
    },
  },
}
