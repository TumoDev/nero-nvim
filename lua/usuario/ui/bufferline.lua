return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = "buffers",                   -- Mostrar buffers en lugar de pestañas
      themable = true,                    -- Permitir la personalización de temas
      right_mouse_command = "bdelete %d", -- Cierra solo el buffer actual al hacer clic derecho
      close_command = function(bufnr)     -- Cierra solo el buffer actual
        vim.api.nvim_buf_delete(bufnr, { force = true })
      end,
      indicator = {
        icon = '▎', -- Icono del indicador
        style = 'icon',
      },
      buffer_close_icon = '󰅖',
      modified_icon = '● ',
      close_icon = ' ',
      left_trunc_marker = ' ',
      right_trunc_marker = ' ',
      max_name_length = 18,
      max_prefix_length = 15, -- Prefijo usado cuando un buffer es duplicado
      truncate_names = true,  -- Truncar nombres de buffers largos
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false, -- Solo aplica a coc
      diagnostics_update_on_event = true,   -- Usar el manejador de diagnósticos de nvim
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "(" .. count .. ")"
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      color_icons = true,       -- Agregar iconos de tipo de archivo con colores
      show_buffer_icons = true, -- Mostrar iconos de tipo de archivo en los buffers
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      show_duplicate_prefix = true,    -- Mostrar prefijo en buffers duplicados
      duplicates_across_groups = true, -- Considerar duplicados en diferentes grupos
      persist_buffer_sort = true,      -- Mantener el orden personalizado de buffers
      move_wraps_at_ends = false,      -- No envolver al mover buffers al inicio o fin
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      auto_toggle_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' }
      },
    },
  },
}
