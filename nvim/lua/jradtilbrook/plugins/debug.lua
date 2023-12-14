return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- Creates a beautiful debugger UI
        "rcarriga/nvim-dap-ui",

        -- Installs the debug adapters for you
        "williamboman/mason.nvim",

        -- Add your own debuggers here
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "PHP",
                port = 9003,
                program = "${file}",
            },
        }

        dap.adapters.php = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/php-debug-adapter",
            options = {
                env = {
                    XDEBUG_SESSION = "1",
                },
            },
        }

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "Continue" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
        vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step over" })
        vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Set breakpoint" })
        vim.keymap.set("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Set conditional breakpoint" })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup({
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
            controls = {
                icons = {
                    pause = "⏸",
                    play = "▶",
                    step_into = "⏎",
                    step_over = "⏭",
                    step_out = "⏮",
                    step_back = "b",
                    run_last = "▶▶",
                    terminate = "⏹",
                },
            },
        })

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        -- Install golang specific config
        require("dap-go").setup()
    end,
}
