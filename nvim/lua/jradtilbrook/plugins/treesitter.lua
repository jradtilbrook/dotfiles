return {
    "nvim-treesitter/nvim-treesitter",
    commit = "f2778bd",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        require("nvim-treesitter.install").update({ with_sync = true })
        -- Disable context info by default. Can use :TSContextToggle to turn it on
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
            context_commentstring = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        })
    end,
}
