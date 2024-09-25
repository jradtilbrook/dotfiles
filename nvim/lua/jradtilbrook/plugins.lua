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


    {
        "ThePrimeagen/git-worktree.nvim",
        opts = {
            update_on_change_command = "Telescope git_files",
        },
        config = function(plugin, opts)
            local worktree = require("git-worktree")
            worktree.setup(opts)
            worktree.on_tree_change(function(op, metadata)
                if op == worktree.Operations.Switch then
                    -- update all other buffers to the worktree directory
                    local windows = vim.api.nvim_list_wins()
                    local buffers = vim.tbl_filter(function(bufn)
                        return vim.api.nvim_buf_is_valid(bufn) and vim.api.nvim_buf_get_option(bufn, "buflisted")
                    end, vim.api.nvim_list_bufs())
                end
            end)

            require("telescope").load_extension("git_worktree")
        end,
    },
}
