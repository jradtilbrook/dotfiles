return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                enable = false,
                max_lines = 0,
                trim_scope = "inner",
            },
            keys = {
                { "<leader>tc", "<cmd>TSContextToggle<cr>", desc = "Toggle treesitter context" },
            },
        },
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            opts = {
                enable_autocmd = false,
            },
        },
    },
    opts = {
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
