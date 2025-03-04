return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- Handy schemas for json and yaml
        "b0o/schemastore.nvim",

        -- Useful status updates for LSP
        { "j-hui/fidget.nvim", opts = {} },

        { "nvimtools/none-ls.nvim", dependencies = { "ThePrimeagen/refactoring.nvim" } },

        -- Additional lua configuration, makes nvim stuff amazing!
        {
            -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            "folke/lazydev.nvim",
            dependencies = {
                { "Bilal2453/luvit-meta", lazy = true },
            },
            ft = "lua",
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },

        {
            "folke/trouble.nvim",
            cmd = { "Trouble" },
            opts = {
                restore = false, -- start back at the top of the list
                follow = false, -- dont automatically follow
            },
        },
    },
    config = function()
        --  This function gets run when an LSP connects to a particular buffer.
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("<leader>cr", vim.lsp.buf.rename, "[R]ename")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("gv", function()
                    require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
                end, "[G]oto [D]efinition (split)")
                map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                map("<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Document Diagnostics")
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                map("K", vim.lsp.buf.hover, "Hover Documentation")
                -- TODO: is this supposed to be shift-k? it conflicts with window navigation, but shift-k will override default help search
                -- map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

                map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
                map("]d", vim.diagnostic.goto_next, "Next diagnostic")

                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                        end,
                    })
                end

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                    map("<leader>th", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, "[T]oggle Inlay [H]ints")
                end
            end,
        })

        -- Enable the following language servers
        local servers = {
            emmet_language_server = {
                filetypes = {
                    "blade",
                    "css",
                    "eruby",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "less",
                    "sass",
                    "scss",
                    "php",
                    "pug",
                    "typescriptreact",
                },
            },
            gopls = {},
            graphql = {
                filetypes = { "php", "typescript", "typescriptreact", "graphql" },
            },
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
            pyright = {},
            tailwindcss = {},
            ts_ls = {
                initializationOptions = {
                    preferences = {
                        importModuleSpecifierPreference = "relative",
                    },
                },
            },
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

        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#phpstan
                null_ls.builtins.diagnostics.phpstan.with({
                    timeout = 10000, -- milliseconds
                }),
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.diagnostics.yamllint,
                null_ls.builtins.code_actions.refactoring.with({
                    filetypes = { "go", "javascript", "lua", "typescript", "typescriptreact", "php" },
                }),
            },
        })

        -- Ensure the servers above are installed
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for ts_ls)
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "php", "blade" },
            callback = function()
                vim.lsp.start({
                    name = "laravel-ls",
                    cmd = { vim.fn.expand("~/developer/laravel-ls/start.sh") },
                    root_dir = vim.fn.getcwd(),
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
