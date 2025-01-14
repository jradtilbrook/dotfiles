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
    },
    config = function()
        local enable_format_on_save = true

        vim.keymap.set("", "<leader>cT", function()
            enable_format_on_save = not enable_format_on_save
        end, { desc = "Toggle auto [F]ormatting" })

        require("conform").setup({
            format_on_save = function(bufnr)
                if enable_format_on_save then
                    -- if we are running eslint, have a huge timeout
                    local formatters = require("conform").list_formatters_to_run(bufnr)
                    for _, v in pairs(formatters) do
                        if v.name == "eslint_d" then
                            return { timeout_ms = 10000 }
                        end
                    end
                    return {}
                end
            end,
            default_format_opts = {
                lsp_format = "fallback",
                timeout_ms = 2000,
            },
            formatters_by_ft = {
                blade = { "blade-formatter" },
                go = { "goimports", "gofmt", "golangci_lint" },
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
