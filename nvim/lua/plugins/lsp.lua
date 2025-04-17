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

  { "ThePrimeagen/refactoring.nvim", lazy = true },

  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#phpstan
        nls.builtins.diagnostics.phpstan.with({
          timeout = 10000, -- milliseconds
          condition = function(utils) return utils.root_has_file({ "phpstan.neon", "phpstan.neon.dist" }) end,
        }),
        nls.builtins.diagnostics.golangci_lint,
        nls.builtins.diagnostics.yamllint,
        nls.builtins.code_actions.refactoring.with({
          filetypes = { "go", "javascript", "lua", "typescript", "typescriptreact", "php" },
        }),
      })
    end,
  },
}
