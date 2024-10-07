return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        format_on_save = { timeout_ms = 5000 },
        default_format_opts = {
            async = true,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            go = { "goimports", "gofmt", "golangci_lint" },
            javascript = { "eslint", "prettier" },
            lua = { "stylua" },
            php = function(bufnr)
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                -- use php-cs-fixer for HE related repos
                if bufname:match("/he/") then
                    return { "php_cs_fixer" }
                end
                return { "pint" }
            end,
            terraform = { "terraform_fmt" },
            typescriptreact = { "eslint", "prettier" },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
