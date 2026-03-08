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
      formatters = {
        yamlfmt = {
          prepend_args = function(self, ctx)
            -- Get indent size from buffer settings (respects editorconfig)
            local indent_size = vim.bo[ctx.buf].shiftwidth
            if indent_size == 0 then
              indent_size = vim.bo[ctx.buf].tabstop
            end

            -- Fall back to 2 if not detected (yamlfmt default)
            if indent_size == 0 then
              indent_size = 2
            end

            return {
              "-formatter", "indent=" .. indent_size,
              "-formatter", "retain_line_breaks_single=true",
            }
          end,
        },
      },
    },
  },
}
