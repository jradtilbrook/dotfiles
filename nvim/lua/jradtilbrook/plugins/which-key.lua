return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.setup({})

        wk.register({
            t = {
                name = "[T]esting",
            },
            s = {
                name = "[S]earching",
            },
            h = {
                name = "[H]arpoon",
            },
            f = {
                name = "[F]loaterm",
            },
            w = {
                name = "LSP [W]orkspace",
            },
        }, { prefix = "<leader>" })
    end,
}
