return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    -- Variable global para controlar el formateo automático
    vim.g.format_on_save_enabled = true

    -- Función para alternar el estado del formateo automático
    local function toggle_format_on_save()
      vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
      if vim.g.format_on_save_enabled then
        print("Formateo automático al guardar: Habilitado")
      else
        print("Formateo automático al guardar: Deshabilitado")
      end
    end

    -- Configuración de conform.nvim
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      -- El formateo automático se controlará mediante el autocomando
    })

    -- Autocomando que formatea al guardar si está habilitado
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        if vim.g.format_on_save_enabled then
          conform.format({
            bufnr = args.buf,
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end
      end,
    })

    -- Comando para alternar el formateo automático
    vim.api.nvim_create_user_command("ToggleFormatOnSave", toggle_format_on_save,
      { desc = "Alterna el formateo automático al guardar" })

    -- Atajo de teclado para alternar el formateo automático
    vim.api.nvim_set_keymap("n", "<leader>tf", ":ToggleFormatOnSave<CR>", { noremap = true, silent = true })
  end,
}
