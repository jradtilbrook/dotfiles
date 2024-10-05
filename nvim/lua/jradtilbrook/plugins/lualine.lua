return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            global_status = true,
            options = {
                component_separators = { left = "·", right = "·" },
                section_separators = { left = "", right = "" },
            },
        })
    end,
}
