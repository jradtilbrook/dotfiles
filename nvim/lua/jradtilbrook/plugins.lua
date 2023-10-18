return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            vim.cmd([[
        highlight WinSeparator guifg=#494d64
        colorscheme catppuccin-macchiato
      ]])
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
        opts = {},
        keys = {
            { "[h", "<cmd>Gitsigns prev_hunk<cr>" },
            { "]h", "<cmd>Gitsigns next_hunk<cr>" },
        },
    },

    -- Show indent markers
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            char = "┆",
            show_trailing_blankline_indent = false,
            show_first_indent_level = false,
            use_treesitter = true,
        },
    },

    -- Show pending keybindings
    { "folke/which-key.nvim",  opts = {} },

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
