return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- opts.highlight = {
      --   enable = true,
      --   additional_vim_regex_highlighting = { 'org', 'markdown' },
      -- }
      vim.list_extend(opts.ensure_installed, {
        'angular',
        'bash',
        'c',
        'c_sharp',
        'css',
        'fish',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'javascript',
        'json',
        'json5',
        'jsonc',
        'lua',
        'luap',
        'markdown',
        'markdown_inline',
        'org',
        'python',
        'query',
        'regex',
        'ron',
        'scss',
        'todotxt',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    optional = true,
    opts = {
      max_lines = 1,
    },
  },
}