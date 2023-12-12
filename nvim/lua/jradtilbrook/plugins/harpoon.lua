return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
        local wk = require("which-key")
        local harpoon = require("harpoon")
        harpoon:setup({})
        wk.register({
            h = {
                h = {
                    function()
                        harpoon:list():append()
                    end,
                    "Append buffer",
                },
                c = {
                    function()
                        harpoon:list():clear()
                    end,
                    "Clear list",
                },
                a = {
                    function()
                        harpoon:list():select(1)
                    end,
                    "Index 1",
                },
                s = {
                    function()
                        harpoon:list():select(2)
                    end,
                    "Index 2",
                },
                d = {
                    function()
                        harpoon:list():select(3)
                    end,
                    "Index 3",
                },
                f = {
                    function()
                        harpoon:list():select(4)
                    end,
                    "Index 4",
                },
                l = {
                    function()
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    "List",
                },
            },
        }, { prefix = "<leader>" })
    end,
}
