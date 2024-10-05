return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        -- Document existing key chains
        spec = {
            { "<leader>b", group = "[B]uffer" },
            { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
            { "<leader>d", group = "[D]ocument" },
            { "<leader>g", group = "[G]it" },
            { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
            { "<leader>r", group = "[R]ename" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>t", group = "[T]oggle/[T]est" },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>x", group = "Diagnostics" },
        },
    },
}
