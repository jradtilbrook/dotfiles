return {
    {
        "catppuccin/nvim",
        priority = 1000,
        opts = {
            custom_highlights = function(colors)
                return {
                    WinSeparator = { fg = colors.surface1 },
                }
            end,
            background = {
                light = "latte",
                dark = "macchiato",
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },

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
    {
        "numToStr/Comment.nvim",
        opts = {
            extra = {
                eol = "gca", -- decapitalise A for ease of rolling
            },
            -- use treesitter plugin to set the correct comment string value
            pre_hook = function(ctx)
                local fn = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
                return fn(ctx)
            end,
        },
    },

    "tpope/vim-eunuch",
    "tpope/vim-abolish",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    {
        "tpope/vim-rhubarb",
        lazy = false,
        keys = {
            { "<leader>gy", ":GBrowse!<cr>", desc = "Copy git URL",    mode = { "n", "v" }, silent = true },
            { "<leader>gv", ":GBrowse<cr>",  desc = "View in browser", mode = { "n", "v" }, silent = true },
        },
    },
    "tpope/vim-surround",
    "tpope/vim-unimpaired",

    -- Keybindings for moving focus
    "christoomey/vim-tmux-navigator",
}
