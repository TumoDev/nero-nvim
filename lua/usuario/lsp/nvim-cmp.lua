---@diagnostic disable: missing-fields

return {
  -- Complemento de autocompletado
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-git",
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirma la selección con Enter
          ['<Down>'] = cmp.mapping.select_next_item(),       -- Navega al siguiente elemento con la flecha abajo
          ['<Up>'] = cmp.mapping.select_prev_item(),         -- Navega al elemento anterior con la flecha arriba
          ['<Esc>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.abort()                         -- Cierra el menú de autocompletado
            else
              fallback()                          -- Si el menú no está visible, ejecuta la función por defecto de <Esc>
            end
          end, { 'i', 's' }),                     -- Disponible en modos Insertar y Selección
          ['<C-Space>'] = cmp.mapping.complete(), -- Muestra manualmente el menú de autocompletado con Ctrl+Espacio
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      })

      -- Configuración para tipos de archivo específicos
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        })
      })

      -- Configuración de fuente para el modo de comando
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },
  -- Complemento para el cierre automático de pares
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
      -- Integración con nvim-cmp
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
