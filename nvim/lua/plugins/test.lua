return {
  { "V13Axel/neotest-pest", lazy = true },
  { "marilari88/neotest-vitest", lazy = true },
  { "nvim-neotest/neotest-jest", lazy = true },
  { "olimorris/neotest-phpunit", lazy = true },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-pest",
        ["neotest-phpunit"] = {
          root_ignore_files = { "tests/Pest.php" },
        },
        "neotest-python",
        "neotest-vitest",
        "neotest-jest",
      },
    },
  },
}
