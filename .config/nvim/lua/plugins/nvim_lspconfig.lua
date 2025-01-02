return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true }, -- Must be loaded before dependants
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim',       opts = {} },
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local lspconfig = require('lspconfig')
            local mason = require('mason')
            local mason_lspconfig = require('mason-lspconfig')
            local mason_tool_installer = require('mason-tool-installer')

            -- Setup Mason
            mason.setup()

            -- LSP capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- Define servers and their settings
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = { callSnippet = 'Replace' },
                            diagnostics = {
                                globals = { "vim", "it", "describe", "before_each", "after_each" },
                            },
                        },
                    },
                },
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "off",         -- Options: "off", "basic", "strict"
                                diagnosticMode = "openFilesOnly", -- Options: "openFilesOnly", "all"
                                autoImportCompletions = true,
                                useLibraryCodeForTypes = true,    -- Use type info from installed libraries
                            },
                        }
                    }
                },
                rust_analyzer = {},
                tailwindcss = {},
                html = {
                    settings = {
                        html = {
                            format = { wrapLineLength = 120, unformatted = "pre,code,textarea" },
                            hover = { documentation = true, references = true },
                        },
                    },
                },
                cssls = {
                    settings = {
                        css = { validate = true },
                        scss = { validate = true },
                        less = { validate = true },
                    },
                },
                emmet_ls = {
                    filetypes = { "html", "css", "javascriptreact", "typescriptreact", "jsx", "tsx" },
                    init_options = {
                        html = { options = { ["bem.enabled"] = true } },
                    },
                },
                -- Add more servers here as needed
            }

            -- Ensure the servers and tools are installed
            local ensure_installed = vim.tbl_keys(servers)
            vim.list_extend(ensure_installed, { "tailwindcss" }) -- Add any additional tools here
            mason_tool_installer.setup { ensure_installed = {
				"prettier",
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"eslint_d",
			}, }

            mason_lspconfig.setup {
                ensure_installed = {
				"cssls",
				"eslint",
				"html",
				"jsonls",
				"ts_ls",
				"pyright",
				"tailwindcss",
				"gopls",
				"golangci_lint_ls",
			},
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        lspconfig[server_name].setup(server)
                    end,
                },
            }



            -- LSP Attach Autocommands
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- Key mappings
                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- Document highlight
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight',
                            { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })
        end,
    }
}
