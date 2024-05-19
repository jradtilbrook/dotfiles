return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- Creates a beautiful debugger UI
        "rcarriga/nvim-dap-ui",

        -- Installs the debug adapters for you
        "williamboman/mason.nvim",

        -- Add your own debuggers here
        "leoluz/nvim-dap-go",
        --
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local dap_go = require("dap-go")

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

        vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "Continue" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
        vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step over" })
        vim.keymap.set("n", "<leader>dt", dap_go.debug_test, { desc = "Debug test" })
        vim.keymap.set("n", "<leader>dl", dap_go.debug_last_test, { desc = "Debug last test" })
        vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Set breakpoint" })
        vim.keymap.set("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Set conditional breakpoint" })
        vim.keymap.set("n", "<leader>de", function()
            dapui.eval(nil, { enter = true })
        end)

        -- Dap UI setup
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        -- Install golang specific config
        dap_go.setup()

        require("nvim-dap-virtual-text").setup()
    end,
}
