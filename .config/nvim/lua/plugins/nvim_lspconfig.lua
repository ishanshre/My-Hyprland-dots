return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- Must be loaded before dependents
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      { "saghen/blink.cmp" },
    },
    config = function()
      local lspconfig = require "lspconfig"
      local mason = require "mason"
      local mason_lspconfig = require "mason-lspconfig"
      local mason_tool_installer = require "mason-tool-installer"

      -- Setup Mason
      mason.setup()

      -- LSP capabilities for autocompletion
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Check if pylyzer is available
      local has_pylyzer = vim.fn.executable "pylyzer" == 1

      -- Servers and their configurations
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              diagnostics = {
                globals = { "vim", "it", "describe", "before_each", "after_each" },
              },
            },
          },
        },
        -- pyright = {
        --   settings = {
        --     python = {
        --       analysis = {
        --         autoSearchPaths = true,
        --         useLibraryCodeForTypes = true,
        --         diagnosticMode = "openFilesOnly", -- or "workspace"
        --         typeCheckingMode = "basic", -- "basic", "off", "strict"
        --         inlayHints = {
        --           variableTypes = true,
        --           functionReturnTypes = true,
        --           parameterNames = true,
        --         },
        --       },
        --     },
        --   },
        -- },
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
      }
      -- Install LSP servers and tools
      local ensure_installed_lsp = vim.tbl_keys(servers)
      local ensure_installed_tools = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "eslint_d",
        "ruff",
      }

      mason_lspconfig.setup {
        ensure_installed = ensure_installed_lsp,
        handlers = {
          function(server_name)
            local server_config = servers[server_name] or {}
            server_config.capabilities =
              vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
            lspconfig[server_name].setup(server_config)
          end,
        },
      }

      mason_tool_installer.setup {
        ensure_installed = ensure_installed_tools,
      }

      -- LSP Attach Auto Commands
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach-config", { clear = true }),
        callback = function(event)
          local buf = event.buf
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- Keymaps
          local function buf_map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
          end

          -- buf_map('n', 'gd', require('telescope.builtin').lsp_definitions, '[LSP] Goto Definition')
          -- buf_map('n', 'gr', require('telescope.builtin').lsp_references, '[LSP] Goto References')
          -- buf_map('n', 'gI', require('telescope.builtin').lsp_implementations, '[LSP] Goto Implementation')
          buf_map(
            "n",
            "gd",
            function() require("fzf-lua").lsp_definitions() end,
            "[LSP] Goto Definition"
          )
          buf_map(
            "n",
            "gr",
            function() require("fzf-lua").lsp_references() end,
            "[LSP] Goto References"
          )
          buf_map(
            "n",
            "gI",
            function() require("fzf-lua").lsp_implementations() end,
            "[LSP] Goto Implementation"
          )

          buf_map("n", "<leader>rn", vim.lsp.buf.rename, "[LSP] Rename")
          buf_map("n", "<leader>ca", vim.lsp.buf.code_action, "[LSP] Code Action")

          -- Document Highlights
          if client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    end,
  },
}
