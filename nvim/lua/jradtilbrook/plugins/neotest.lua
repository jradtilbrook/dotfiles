return {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- test runners
        "V13Axel/neotest-pest",
        "nvim-neotest/neotest-jest",
        "olimorris/neotest-phpunit",
    },
    keys = {
        {
            "<leader>tn",
            function()
                require("neotest").run.run()
            end,
            desc = "[T]est [N]earest",
        },
        {
            "<leader>tf",
            function()
                require("neotest").run.run(vim.fn.expand("%"))
            end,
            desc = "[T]est [F]ile",
        },
        {
            "<leader>tw",
            function()
                require("neotest").watch.toggle(vim.fn.expand("%"))
            end,
            desc = "[T]est [W]atch",
        },
        {
            "<leader>ts",
            function()
                require("neotest").run.run({ suite = true })
            end,
            desc = "[T]est [S]uite",
        },
        {
            "<leader>tl",
            function()
                require("neotest").run.run_last()
            end,
            desc = "[T]est [L]ast",
        },
        -- visiting the "last test" looks somewhat doable but id have to code it up. see neotest.run.get_last_run()
        -- { "<leader>tv", "<cmd>TestVisit<CR>", desc = "[T]est [V]isit" },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-pest")({
                    pest_cmd = "vendor/bin/pest",
                }),
                require("neotest-phpunit")({
                    filter_dirs = { ".git", "node_modules", "vendor" },
                    root_ignore_files = { "tests/Pest.php" },
                }),
                require("neotest-jest")({}),
            },
        })
    end,
}
