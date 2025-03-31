return {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    event = "VeryLazy",
    dependencies = {
        { "zbirenbaum/copilot-cmp", opts = {} },
        {
            "zbirenbaum/copilot.lua",
            opts = {
                suggestion = { enabled = false },
                panel = { enabled = false },
                server_opts_overrides = {
                    trace = "verbose",
                    cmd = {
                        vim.fn.expand("~/.local/share/nvim/mason/bin/copilot-language-server"),
                        "--stdio",
                    },
                },
            },
        },
        { "nvim-lua/plenary.nvim" },
    },
    opts = {
        -- debug = true,
    },
}
