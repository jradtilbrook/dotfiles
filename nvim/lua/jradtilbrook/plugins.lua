return {
    {
        "catppuccin/nvim",
        priority = 1000,
        opts = {
            custom_highlights = function(colors)
                return {
                    FloatermBorder = { bg = colors.base, fg = colors.blue },
                    WinSeparator = { fg = colors.surface1 },
                }
            end,
        },
        config = function(plugin, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },

    "wakatime/vim-wakatime",

    -- Add more languages
    "sheerun/vim-polyglot",

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },

    -- Show indent markers
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "┆",
            },
            scope = {
                enabled = false,
            },
        },
    },

    -- Keybindings for comments
    { "numToStr/Comment.nvim",    config = true },

    { "folke/todo-comments.nvim", config = true },

    "tpope/vim-eunuch",
    "tpope/vim-abolish",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    {
        "tpope/vim-rhubarb",
        keys = {
            { "<leader>gy", ":GBrowse!<cr>", desc = "Copy git URL",    mode = { "n", "v" }, silent = true },
            { "<leader>gv", ":GBrowse<cr>",  desc = "View in browser", mode = { "n", "v" }, silent = true },
        },
    },
    "tpope/vim-surround",
    "tpope/vim-unimpaired",

    -- Extra text objects for HTML attributes
    {
        "whatyouhide/vim-textobj-xmlattr",
        dependencies = {
            "kana/vim-textobj-user",
        },
    },

    -- Automatically insert matching brackets
    { "windwp/nvim-autopairs", opts = {} },

    -- Handy keymapping to split/join lines (eg arrays)
    {
        "AndrewRadev/splitjoin.vim",
        init = function()
            vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end,
    },

    -- Automatically fix indentation when pasting
    {
        "sickill/vim-pasta",
        init = function()
            vim.g.pasta_disabled_filetypes = { "fugitive" }
        end,
    },

    -- Keybindings for moving focus
    "christoomey/vim-tmux-navigator",

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
        end,
    },
}
