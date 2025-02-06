return {
    "jellydn/hurl.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    ft = "hurl",
    opts = {
        debug = false,
        show_notification = false,
        mode = "popup",
        formatters = {
            json = { "jq" },
        },
        mappings = {
            close = "q",
            next_panel = "<C-n>",
            prev_panel = "<C-p>",
        },
    },
    keys = {
        -- Run API request
        { "<localleader>hf", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
        { "<localleader>hn", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
        { "<localleader>hl", "<cmd>HurlRerun<CR>", desc = "Run last request" },
        { "<localleader>ho", "<cmd>HurlShowLastResponse<CR>", desc = "Show last response" },
        -- Run Hurl request in visual mode
        { "<leader>h", "<cmd>HurlRunner<CR>", desc = "Run selected requests", mode = "v" },
    },
}
