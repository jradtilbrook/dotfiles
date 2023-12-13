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
        vim.g.floaterm_width = 0.35
        vim.g.floaterm_wintype = "vsplit"
        vim.g.floaterm_title = " floaterm ($1/$2) "
        vim.g.floaterm_titleposition = "center"
        vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
    end,
}
