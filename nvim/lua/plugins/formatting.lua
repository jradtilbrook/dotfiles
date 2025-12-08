return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      -- default_format_opts = {
      --   timeout_ms = 10000, -- eslint_d can take a stupid long time
      -- },
      formatters_by_ft = {
        blade = { "blade-formatter" },
        go = { "goimports", "gofumpt", "golangci-lint" },
        graphql = { "prettierd" },
        javascript = { "eslint_d", "prettierd" },
        json = { "jq" },
        typescript = { "eslint_d", "prettierd" },
        lua = { "stylua" },
        php = { "pint" },
        terraform = { "terraform_fmt" },
        typescriptreact = { "eslint_d", "prettierd" },
        yaml = { "yamlfmt" },
      },
    },
  },
}
