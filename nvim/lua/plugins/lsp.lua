return {
  {
    -- LazyVim configures pretty much everything I want in a useful way
    -- but these are the ones that need a bit more or are missing
    -- TODO: these filetypes dont seem to be taking effect
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
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
