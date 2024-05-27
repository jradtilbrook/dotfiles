return {
    "gbprod/yanky.nvim",
    dependencies = {
        "kkharji/sqlite.lua",
    },
    lazy = false,
    opts = {
        ring = {
            storage = "sqlite",
            storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db",
        },
        highlight = {
            timer = 300,
        },
    },
    keys = {
        { "<leader>p", "<cmd>Telescope yank_history<CR>", desc = "Clipboard history" },
        { "y",         "<Plug>(YankyYank)",               mode = { "n", "x" },       desc = "Yank text" },
        { "p",         "<Plug>(YankyPutAfter)",           mode = { "n", "x" },       desc = "Put yanked text after cursor" },
        { "P",         "<Plug>(YankyPutBefore)",          mode = { "n", "x" },       desc = "Put yanked text before cursor" },
    },
    config = function(plugin, opts)
        require("yanky").setup(opts)

        require("telescope").load_extension("yank_history")
    end,
}
