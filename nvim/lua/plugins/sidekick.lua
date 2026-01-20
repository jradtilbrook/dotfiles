return {
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = false,
      },
      cli = {
        mux = {
          backend = "tmux",
          create = "window",
          enabled = true,
        },
      },
    },
  },
}
