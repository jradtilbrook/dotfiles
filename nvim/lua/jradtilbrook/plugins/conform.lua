return {
    "stevearc/conform.nvim",
    event = { "VeryLazy" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ timeout_ms = 10000 })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
        {
            "<leader>cT",
            function()
                vim.b.disable_auto_format = not vim.b.disable_auto_format

                local state = vim.b.disable_auto_format and "disabled" or "enabled"
                vim.notify(string.format("Format on save %s for buffer %s", state, vim.api.nvim_buf_get_name(0)))
            end,
            mode = "",
            desc = "Toggle auto [F]ormatting",
        },
    },
    config = function()
        vim.api.nvim_create_user_command("ConformEnabled", function()
            local state = vim.b.disable_auto_format and "disabled" or "enabled"
            vim.notify(string.format("Format on save %s for buffer %s", state, vim.api.nvim_buf_get_name(0)))
        end, {})

        require("conform").setup({
            format_on_save = function(bufnr)
                if vim.b[bufnr].disable_auto_format then
                    return nil
                end

                -- if we are running eslint, have a huge timeout
                local formatters = require("conform").list_formatters_to_run(bufnr)
                for _, v in pairs(formatters) do
                    if v.name == "eslint_d" then
                        return { timeout_ms = 10000 }
                    end
                end

                return {}
            end,
            default_format_opts = {
                lsp_format = "fallback",
                timeout_ms = 2000,
            },
            formatters_by_ft = {
                blade = { "blade-formatter" },
                go = { "goimports", "gofmt", "golangci_lint" },
                graphql = { "prettierd" },
                javascript = { "eslint_d", "prettierd" },
                json = { "jq" },
                typescript = { "eslint_d", "prettierd" },
                lua = { "stylua" },
                php = function(bufnr)
                    local bufname = vim.api.nvim_buf_get_name(bufnr)
                    if bufname:match("/he/") then
                        return { "php_cs_fixer" }
                    end
                    return { "pint" }
                end,
                terraform = { "terraform_fmt" },
                typescriptreact = { "eslint_d", "prettierd" },
                yaml = { "yamlfmt" },
            },
        })
    end,
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
