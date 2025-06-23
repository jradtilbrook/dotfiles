return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
        php = { "phpstan" },
        yaml = { "yamllint" },
      },
    },
  },
}
