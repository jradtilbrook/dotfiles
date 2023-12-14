return {
    "danymat/neogen",
    ft = { "go", "php" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Neogen",
    keys = {
        { "<leader>cg", ":Neogen<cr>", desc = "Generate annotation" },
    },
    opts = {
        snippet_engine = "luasnip",
    },
}
