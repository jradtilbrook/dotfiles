return {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    opts = {
        current_line_blame_opts = {
            delay = 200,
        },
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end)

            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end)
        end,
    },
    keys = {
        { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame virtual text" },
        { "<leader>gl", "<cmd>Gitsigns blame_line<cr>",                desc = "Blame line" },
        { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",              desc = "Preview hunk" },
        { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",                desc = "Stage hunk" },
        { "<leader>gS", "<cmd>Gitsigns undo_stage_hunk<cr>",           desc = "Unstage hunk" },
        { "<leader>gu", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Undo hunk" },
        { "<leader>gw", "<cmd>Gitsigns toggle_word_diff<cr>",          desc = "Toggle word diff" },
        {
            "<leader>gtc",
            function()
                require("telescope").extensions.git_worktree.git_worktrees()
            end,
            desc = "Change worktree",
        },
        {
            "<leader>gta",
            function()
                require("telescope").extensions.git_worktree.create_git_worktree()
            end,
            desc = "Add worktree",
        },
    },
}
