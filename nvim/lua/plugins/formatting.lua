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
        php = function()
          -- work related things use php-cs-fixer, but everything else is pint
          if string.match(LazyVim.root.git(), "/he/") or string.match(LazyVim.root.git(), "/src/") then
            return { "php_cs_fixer" }
          end
          return { "pint" }
        end,
        terraform = { "terraform_fmt" },
        typescriptreact = { "eslint_d", "prettierd" },
        yaml = { "yamlfmt" },
      },
    },
  },
}
