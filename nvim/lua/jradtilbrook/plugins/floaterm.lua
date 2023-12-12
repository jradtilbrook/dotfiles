return {
    "voldikss/vim-floaterm",
    lazy = true,
    cmd = {
        "FloatermNew",
    },
    keys = {
        { "<leader>ft", "<cmd>FloatermToggle<CR>", desc = "[F]loaterm [T]oggle" },
    },
    config = function()
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
    end,
}
