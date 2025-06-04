return {
  { "marilari88/neotest-vitest", lazy = true },
  { "nvim-neotest/neotest-jest", lazy = true },
  {
    "nvim-neotest/neotest",
    opts = function(_, opts)
      table.insert(opts.adapters, "neotest-vitest")
      table.insert(opts.adapters, "neotest-jest")
    end,
  },
}
