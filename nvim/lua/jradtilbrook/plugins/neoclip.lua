return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        { "kkharji/sqlite.lua", module = "sqlite" },
    },
    keys = {
        { "<leader>p", "<cmd>Telescope neoclip<CR>", desc = "Clipboard history" },
    },
    opts = {
        continuous_sync = true,
        enable_persistent_history = true,
    },
}
