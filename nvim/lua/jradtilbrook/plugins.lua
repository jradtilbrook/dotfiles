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
    { "numToStr/Comment.nvim", opts = {} },

    "tpope/vim-eunuch",
    "tpope/vim-abolish",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    {
        "tpope/vim-rhubarb",
        keys = {
            { "<leader>gy", ":silent GBrowse!<cr>", desc = "Copy git URL",    mode = { "n", "v" }, silent = true },
            { "<leader>gv", ":silent GBrowse<cr>",  desc = "View in browser", mode = { "n", "v" }, silent = true },
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
        setup = function()
            vim.g.pasta_disabled_filetypes = { "fugitive" }
        end,
    },

    -- Keybindings for moving focus
    "christoomey/vim-tmux-navigator",
}
