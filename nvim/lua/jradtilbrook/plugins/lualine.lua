return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "AndreM222/copilot-lualine" },
    config = function()
        require("lualine").setup({
            global_status = true,
            sections = {
                lualine_x = {
                    { "copilot", show_colors = true, show_loading = true },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
            },
            options = {
                section_separators = { left = "", right = "" },
                component_separators = { left = "·", right = "·" },
            },
        })
    end,
}
