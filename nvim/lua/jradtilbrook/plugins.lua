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

    -- Git markers in the signcolumn
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        opts = {
            current_line_blame_opts = {
                delay = 200,
            },
        },
        keys = {
            { "[h",         "<cmd>Gitsigns prev_hunk<cr>",                 { desc = "Previous hunk" } },
            { "]h",         "<cmd>Gitsigns next_hunk<cr>",                 { desc = "Next hunk" } },
            { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle line blame" } },
            { "<leader>gl", "<cmd>Gitsigns blame_line<cr>",                { desc = "Blame line" } },
            { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",              { desc = "Preview hunk" } },
            { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",                { desc = "Stage hunk" } },
            { "<leader>gS", "<cmd>Gitsigns undo_stage_hunk<cr>",           { desc = "Unstage hunk" } },
            { "<leader>gw", "<cmd>Gitsigns toggle_word_diff<cr>",          { desc = "Toggle word diff" } },
        },
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
    "tpope/vim-rhubarb",
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
