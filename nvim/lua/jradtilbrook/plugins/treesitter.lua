return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                enable = true,
                max_lines = 0,
                trim_scope = "inner",
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
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
