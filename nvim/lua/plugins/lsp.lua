return {
  {
    -- LazyVim configures pretty much everything I want in a useful way
    -- but these are the ones that need a bit more or are missing
    -- TODO: these filetypes dont seem to be taking effect
    "neovim/nvim-lspconfig",
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

  {
    "nvimtools/none-ls.nvim",
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
        -- TODO: https://github.com/laravel-ls/laravel-ls get this working through null-ls
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/HELPERS.md#generator_factory
        -- {
        --   method = nls.methods.COMPLETION,
        --   filetypes = { "php", "blade" },
        --   generator = nls.generator({
        --     command = vim.fn.expand("~/developer/laravel-ls/start.sh"),
        --   }),
        -- },
      })
    end,
  },
}
