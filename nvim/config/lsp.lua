require('lspconfig').intelephense.setup{}

require('lspconfig').gopls.setup{
  cmd = {"gopls", "-vv", "serve"},
}
