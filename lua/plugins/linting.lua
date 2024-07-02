return {
  'mfussenegger/nvim-lint',
  opts = {
    linters = {
      markdownlint = {
        args = { '--config', '~/.markdownlint.yaml', '--' },
      },
    },
  },
}
