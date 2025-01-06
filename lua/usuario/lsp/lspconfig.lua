return {
  "neovim/nvim-lspconfig",
  dependences = {
    "williamboman/mason.nvim",
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticHint" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticWarn" })
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticError" })

    local lspconfig = require('lspconfig')


    -- Lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT', -- Especifica la versión de Lua
          },
          diagnostics = {
            globals = { 'vim' }, -- Reconoce la variable global 'vim'
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- Asegura que el servidor reconozca los archivos runtime de Neovim
          },
          telemetry = {
            enable = false, -- Desactiva la telemetría
          },
        },
      },
    })

    --php
    local util = require("lspconfig.util")

    lspconfig.intelephense.setup({
      cmd = { "intelephense", "--stdio" },
      filetypes = { "php" },
      root_dir = function(fname)
        return util.root_pattern("composer.json", ".git")(fname) or vim.fs.dirname(fname)
      end,
      settings = {
        intelephense = {
          format = {
            enable = false,
          },
        },
      },
    })

    --html
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = function(_, _)
        -- Configura tus atajos de teclado y otras opciones aquí
      end,
    })

    --vue
    lspconfig.volar.setup {
      -- add filetypes for typescript, javascript and vue
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      init_options = {
        vue = {
          -- disable hybrid mode
          hybridMode = false,
        },
      },
    }
    -- css
    lspconfig.cssls.setup {
      capabilities = capabilities,
      filetypes = { 'css', 'scss', 'less' },
      root_dir = lspconfig.util.root_pattern('package.json', '.git'),
      settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
      },
    }

    --astro
    lspconfig.astro.setup({
      on_attach = function(client, bufnr)
        -- Configuraciones adicionales al adjuntar el cliente LSP
      end,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      filetypes = { 'astro' },
      root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', '.git'),
    })
    -- python
    lspconfig.pyright.setup {
      on_attach = function(client, bufnr)
        -- Configuraciones adicionales al adjuntar el cliente LSP
      end,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      root_dir = lspconfig.util.root_pattern('.git', 'setup.py', 'setup.cfg', 'pyproject.toml', 'requirements.txt'),
    }
    -- typescript
    lspconfig.ts_ls.setup {
      on_attach = function(client, bufnr)
        -- Configuraciones adicionales, como mapeos de teclas, pueden añadirse aquí
      end,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      cmd = { "typescript-language-server", "--stdio" },
      root_dir = require('lspconfig.util').root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git'),
      single_file_support = true,
    }
  end,
}
