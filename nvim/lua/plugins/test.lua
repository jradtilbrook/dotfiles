return {
  { "marilari88/neotest-vitest", lazy = true },
  { "nvim-neotest/neotest-jest", lazy = true },
  { "jradtilbrook/neotest-pest", branch = "ts-fix", lazy = true }, -- using my fork to fix treesitter query
  -- { "V13Axel/neotest-pest", enabled = false },
  { "olimorris/neotest-phpunit", lazy = true },
  {
    "nvim-neotest/neotest",
    commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c", -- TEMP: bug on latest commit
    opts = {
      adapters = {
        "neotest-vitest",
        "neotest-jest",
        "neotest-pest",
        ["neotest-phpunit"] = {
          root_ignore_files = { "tests/Pest.php" },
        },
      },
    },
  },
}
