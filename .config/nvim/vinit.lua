local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false
      },
      checkOnSave = {
        enable = false
      },
    },
  },
}
