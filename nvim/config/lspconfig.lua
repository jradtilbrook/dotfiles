require('nvim-lsp-installer').setup{
  automatic_installation = true,
}

local lspconfig = require('lspconfig')

lspconfig.dockerls.setup{}

lspconfig.gopls.setup{
  cmd = {"gopls", "-vv", "serve"},
}

lspconfig.graphql.setup{}

lspconfig.intelephense.setup{}

lspconfig.solargraph.setup{}

lspconfig.sumneko_lua.setup{}

lspconfig.tailwindcss.setup{}

-- TODO:
-- tsserver?
-- phpactor (instead of the vim plugin?)
-- some python option
-- ruby: solargraph
