return {
    "vim-test/vim-test",
    lazy = true,
    keys = {
        { "<leader>tn", "<cmd>TestNearest<CR>", desc = "[T]est [N]earest" },
        { "<leader>tf", "<cmd>TestFile<CR>",    desc = "[T]est [F]ile" },
        { "<leader>ts", "<cmd>TestSuite<CR>",   desc = "[T]est [S]uite" },
        { "<leader>tl", "<cmd>TestLast<CR>",    desc = "[T]est [L]ast" },
        { "<leader>tv", "<cmd>TestVisit<CR>",   desc = "[T]est [V]isit" },
    },
    init = function()
        -- Running PHP tests defaults to pest if installed, so change it to PHPUnit
        -- which supports sail
        vim.cmd([[
            let g:test#enabled_runners = ['php#phpunit', 'go#gotest']
            let test#strategy = "toggleterm"
        ]])
    end,
}
