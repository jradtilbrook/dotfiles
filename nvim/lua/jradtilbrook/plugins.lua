return {
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = false,
        },
        keys = {
            {
                "[t",
                function()
                    require("todo-comments").jump_prev()
                end,
                desc = "Previous todo comment",
                mode = { "n" },
                silent = true,
            },
            {
                "]t",
                function()
                    require("todo-comments").jump_next()
                end,
                desc = "Next todo comment",
                mode = { "n" },
                silent = true,
            },
        },
    },

    -- Extra text objects for HTML attributes
    {
        "whatyouhide/vim-textobj-xmlattr",
        dependencies = {
            "kana/vim-textobj-user",
        },
    },

    -- Automatically insert matching brackets
    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

    -- Handy keymapping to split/join lines (eg arrays)
    {
        "bennypowers/splitjoin.nvim",
        event = "VimEnter",
        keys = {
            { "<leader>cj", function() end, mode = { "n", "v" }, desc = "Join object under cursor" },
            { "<leader>c,", function() end, mode = { "n", "v" }, desc = "Split object under cursor" },
        },
    },

    -- Automatically fix indentation when pasting
    {
        "sickill/vim-pasta",
        init = function()
            vim.g.pasta_disabled_filetypes = { "fugitive" }
        end,
    },
}
