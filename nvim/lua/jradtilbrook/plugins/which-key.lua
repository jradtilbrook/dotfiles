return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.setup({})

        wk.register({
            b = {
                name = "Buffers",
            },
            c = {
                name = "Code actions",
            },
            d = {
                name = "Debugging",
            },
            t = {
                name = "Testing",
            },
            s = {
                name = "Searching",
            },
            h = {
                name = "Harpoon",
            },
            g = {
                name = "Git",
                mode = { "n", "v" },
            },
            f = {
                name = "Terminal",
            },
            w = {
                name = "LSP Workspace",
            },
        }, { prefix = "<leader>" })
    end,
}
