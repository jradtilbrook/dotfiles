-- Laravel LSP: https://github.com/laravel/lsp
-- Install globally with: composer global require laravel/lsp
-- TODO: install with mason when available
if vim.lsp.config then
  vim.lsp.config("laravel_lsp", {
    cmd = { "laravel-lsp" },
    filetypes = { "php", "blade" },
    root_markers = { "artisan", "composer.json", ".git" },
  })
  vim.lsp.enable("laravel_lsp")
end

return {
  {
    -- LazyVim configures pretty much everything I want in a useful way
    -- but these are the ones that need a bit more or are missing
    -- TODO: these filetypes dont seem to be taking effect
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        emmet_language_server = {
          -- stylua: ignore
          filetypes = { "blade", "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "php", "pug", "typescriptreact" },
        },
        graphql = {
          filetypes = { "graphql", "php", "typescript", "typescriptreact" },
        },
      },
    },
  },
}
