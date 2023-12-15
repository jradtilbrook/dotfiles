return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {
        current_line_blame_opts = {
            delay = 200,
        },
    },
    keys = {
        { "[h",         "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Previous hunk" },
        { "]h",         "<cmd>Gitsigns next_hunk<cr>",                 desc = "Next hunk" },
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
    config = function(plugin, opts)
        require("gitsigns").setup(opts)

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            name = "Lazygit",
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })

        vim.keymap.set({ "n", "t" }, "<leader>gg", function()
            lazygit:toggle()
        end, { desc = "Toggle lazygit terminal" })
    end,
}
