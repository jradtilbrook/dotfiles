return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Handy schemas for json and yaml
        'b0o/schemastore.nvim',
        -- Inject extra things into LSP
        'jose-elias-alvarez/null-ls.nvim',
        'jayp0521/mason-null-ls.nvim',

        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim', opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        { 'folke/neodev.nvim', opts = {} },

        {
            'folke/trouble.nvim',
            opts = {
                mode = 'document_diagnostics'
            }
        },
    },
    config = function()
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>dd', '<cmd>TroubleToggle document_diagnostics<cr>', '[D]ocument [D]iagnostics')
            nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            -- Diagnostic keymaps
            nmap('[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
            nmap(']d', vim.diagnostic.goto_next, 'Next diagnostic')
            nmap('<leader>e', vim.diagnostic.open_float, 'Open diagnostic errors')
            nmap('<leader>q', vim.diagnostic.setloclist, 'Show location list diagnostic errors')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.formatting, { desc = 'Format current buffer with LSP' })
        end

        -- Enable the following language servers
        local servers = {
            gopls = {},
            graphql = {},
            intelephense = {},
            jsonls = {
                json = {
                    schemas = require('schemastore').json.schemas(),
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
                schemas = require('schemastore').json.schemas(),
            },
        }

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Setup mason so it can manage external tooling
        require('mason').setup()

        local formatting = require('null-ls').builtins.formatting
        require('null-ls').setup {
            sources = {
                formatting.pint,
                formatting.stylua,
            },
        }
        require('mason-null-ls').setup({
            automatic_installation = true,
        })

        -- Ensure the servers above are installed
        local mason_lspconfig = require 'mason-lspconfig'

        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }

        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                }
            end,
        }

        -- Diagnostic configuration
        vim.diagnostic.config {
            virtual_text = false,
            float = {
                source = true,
            },
        }
    end,
}
