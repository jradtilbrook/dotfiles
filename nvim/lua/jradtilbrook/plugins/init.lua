return {
    {
        "catppuccin/nvim",
        priority = 1000,
        opts = {
            custom_highlights = function(colors)
                return {
                    WinSeparator = { fg = colors.surface1 },
                    -- darken indent markers
                    SnacksIndent = { fg = colors.surface0 },
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
    "aviator-co/av-vim-plugin",
    {
        "davidmh/mdx.nvim",
        config = true,
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
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
    -- highlight and navigate comments
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

    "tpope/vim-eunuch",
    "tpope/vim-abolish",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    {
        "tpope/vim-rhubarb",
        lazy = false,
        keys = {
            { "<leader>gy", ":GBrowse!<cr>", desc = "Copy git URL", mode = { "n", "v" }, silent = true },
            { "<leader>gv", ":GBrowse<cr>", desc = "View in browser", mode = { "n", "v" }, silent = true },
        },
    },
    "tpope/vim-surround",
    "tpope/vim-unimpaired",

    -- Keybindings for moving focus
    "christoomey/vim-tmux-navigator",
}
