return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "blade" },
    },
  },
  {
    -- this overrides the LazyVim extra: lazyvim.plugins.extras.ui.treesitter-context
    "nvim-treesitter/nvim-treesitter-context",
    optional = true,
    opts = {
      -- default context off and turn it on when desired with <leader>ut
      enable = false,
    },
  },
}
