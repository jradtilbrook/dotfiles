return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    cmd = {
        "ToggleTerm",
    },
    keys = {
        { "<leader>ft", "<cmd>ToggleTerm name=scratch<CR>", desc = "Toggle terminal" },
    },
    opts = {
        autochdir = true,
        float_opts = {
            border = "curved",
        },
        highlights = {
            Normal = {
                guibg = require("catppuccin.palettes").get_palette("macchiato").mantle,
            },
            FloatBorder = {
                guifg = require("catppuccin.palettes").get_palette("macchiato").blue,
            },
        },
        shade_terminals = false,
        winbar = {
            enabled = true,
        },
    },
}
