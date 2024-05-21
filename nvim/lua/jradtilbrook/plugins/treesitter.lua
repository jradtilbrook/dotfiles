return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        require("nvim-treesitter.install").update({ with_sync = true })
        require("treesitter-context").setup({
            enable = true,
            max_lines = 0,
            trim_scope = "inner",
        })

        require("nvim-treesitter.configs").setup({
            ensure_installed = "all",
            highlight = { enable = true, additional_vim_regex_highlighting = true },
            indent = { enable = true, disable = { "python" } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<C-S-space>",
                },
            },
        })

        vim.g.skip_ts_context_commentstring_module = true
        require("ts_context_commentstring").setup({})
    end,
}
