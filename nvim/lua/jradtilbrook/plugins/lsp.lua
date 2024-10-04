return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- Handy schemas for json and yaml
        "b0o/schemastore.nvim",
        -- Inject extra things into LSP
        {
            "stevearc/conform.nvim",
            event = { "BufWritePre" },
            cmd = { "ConformInfo" },
            keys = {
                {
                    "<leader>cf",
                    function()
                        require("conform").format({ async = true, lsp_format = "fallback" })
                    end,
                    mode = "",
                    desc = "[F]ormat buffer",
                },
            },
            opts = {
                notify_on_error = false,
                format_on_save = function(bufnr)
                    -- Disable "format_on_save lsp_fallback" for languages that don't
                    -- have a well standardized coding style. You can add additional
                    -- languages here or re-enable it for the disabled ones.
                    local disable_filetypes = { c = true, cpp = true }
                    local lsp_format_opt
                    if disable_filetypes[vim.bo[bufnr].filetype] then
                        lsp_format_opt = "never"
                    else
                        lsp_format_opt = "fallback"
                    end
                    return {
                        timeout_ms = 5000,
                        lsp_format = lsp_format_opt,
                    }
                end,
                formatters_by_ft = {
                    lua = { "stylua" },
                    php = { "php_cs_fixer" },
                    -- Conform can also run multiple formatters sequentially
                    -- python = { "isort", "black" },
                    --
                    -- You can use 'stop_after_first' to run the first available formatter from the list
                    -- javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            },
        },

        -- Useful status updates for LSP
        { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        { "folke/neodev.nvim", opts = {} },

        {
            "folke/trouble.nvim",
            opts = {
                mode = "document_diagnostics",
            },
        },
    },
    config = function()
        -- Switch for controlling whether you want autoformatting.
        --  Use :FormatToggle to toggle autoformatting on or off
        local format_is_enabled = true
        vim.api.nvim_create_user_command("FormatToggle", function()
            format_is_enabled = not format_is_enabled
            print("Setting autoformatting to: " .. tostring(format_is_enabled))
        end, {})
        -- Create an augroup that is used for managing our formatting autocmds.
        --      We need one augroup per client to make sure that multiple clients
        --      can attach to the same buffer without interfering with each other.
        local _augroups = {}
        local get_augroup = function(client)
            if not _augroups[client.id] then
                local group_name = "lsp-format-" .. client.name
                local id = vim.api.nvim_create_augroup(group_name, { clear = true })
                _augroups[client.id] = id
            end

            return _augroups[client.id]
        end
        -- Whenever an LSP attaches to a buffer, we will run this function.
        --
        -- See `:help LspAttach` for more information about this autocmd event.
        vim.api.nvim_create_autocmd("LspAttach", {
            -- This is where we attach the autoformatting for reasonable clients
            callback = function(args)
                local client_id = args.data.client_id
                local client = vim.lsp.get_client_by_id(client_id)
                local bufnr = args.buf

                -- Only attach to clients that support document formatting
                if not client.server_capabilities.documentFormattingProvider then
                    return
                end

                -- Tsserver usually works poorly. Sorry you work with bad languages
                -- You can remove this line if you know what you're doing :)
                if client.name == "tsserver" then
                    return
                end

                -- Create an autocmd that will run *before* we save the buffer.
                --  Run the formatting command for the LSP that has just attached.
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = get_augroup(client),
                    buffer = bufnr,
                    callback = function()
                        if not format_is_enabled then
                            return
                        end

                        vim.lsp.buf.format({
                            async = false,
                            filter = function(c)
                                return c.id == client.id
                            end,
                        })
                    end,
                })
            end,
        })

        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(client, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("<leader>cr", vim.lsp.buf.rename, "Rename")
            nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")

            nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
            nmap("gv", function()
                require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
            end, "[G]oto [D]efinition")
            nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
            nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
            nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
            nmap("<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>", "[D]ocument [D]iagnostics")
            nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

            -- Diagnostic keymaps
            nmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
            nmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
            nmap("<leader>e", vim.diagnostic.open_float, "Open diagnostic errors")
            nmap("<leader>q", vim.diagnostic.setloclist, "Show location list diagnostic errors")

            -- See `:help K` for why this keymap
            nmap("K", vim.lsp.buf.hover, "Hover Documentation")
            -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
            nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
            nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
            nmap("<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, "[W]orkspace [L]ist Folders")

            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
                end,
            })

            -- add cursor highlighting of word under cursor
            if client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
                vim.api.nvim_create_autocmd("CursorHold", {
                    callback = vim.lsp.buf.document_highlight,
                    buffer = bufnr,
                    group = "lsp_document_highlight",
                    desc = "Document Highlight",
                })
                vim.api.nvim_create_autocmd("CursorMoved", {
                    callback = vim.lsp.buf.clear_references,
                    buffer = bufnr,
                    group = "lsp_document_highlight",
                    desc = "Clear All the References",
                })
            end
        end

        -- Enable the following language servers
        local servers = {
            gopls = {},
            graphql = {},
            intelephense = {},
            jsonls = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            tailwindcss = {},
            yamlls = {
                yaml = {
                    schemaStore = {
                        -- You must disable built-in schemaStore support if you want to use
                        -- this plugin and its advanced options like `ignore`.
                        enable = false,
                        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas({
                        ignore = {
                            "Goreleaser",
                        },
                        replace = {
                            ["Goreleaser Pro"] = {
                                description = "Goreleaser Pro configuration file",
                                fileMatch = {
                                    ".goreleaser.yml",
                                    ".goreleaser.yaml",
                                    "goreleaser.yml",
                                    "goreleaser.yaml",
                                },
                                name = "Goreleaser Pro",
                                url = "https://goreleaser.com/static/schema-pro.json",
                            },
                        },
                    }),
                },
            },
        }

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- Setup mason so it can manage external tooling
        require("mason").setup()

        local formatting = require("null-ls").builtins.formatting
        local diagnostic = require("null-ls").builtins.diagnostics
        require("null-ls").setup({
            sources = {
                formatting.gofmt,
                formatting.pint,
                formatting.stylua,
                diagnostic.golangci_lint,
            },
        })
        require("mason-null-ls").setup({
            automatic_installation = true,
        })

        -- Ensure the servers above are installed
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                })
            end,
        })

        -- Diagnostic configuration
        vim.diagnostic.config({
            virtual_text = false,
            float = {
                source = true,
            },
        })
    end,
}
