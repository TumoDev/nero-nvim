return {
  "rmagatti/goto-preview",
  event = "BufEnter",
  config = function()
    require('goto-preview').setup({
      width = 120, -- Ancho de la ventana flotante
      height = 15, -- Altura de la ventana flotante
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Caracteres de borde de la ventana flotante
      default_mappings = false, -- No vincular mapeos predeterminados
      debug = false, -- No imprimir información de depuración
      opacity = nil, -- Nivel de opacidad de la ventana flotante (0-100), donde 100 es completamente transparente
      resizing_mappings = false, -- No vincular teclas de flecha para redimensionar la ventana flotante
      post_open_hook = nil, -- Función que se ejecuta después de abrir la ventana flotante
      post_close_hook = nil, -- Función que se ejecuta después de cerrar la ventana flotante
      references = {
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
      },
      focus_on_open = true,                                        -- Enfocar la ventana flotante al abrirla
      dismiss_on_move = false,                                     -- No cerrar la ventana flotante al mover el cursor
      force_close = true,                                          -- Forzar el cierre de la ventana flotante
      bufhidden = "wipe",                                          -- Configuración de 'bufhidden' para la ventana flotante
      stack_floating_preview_windows = true,                       -- Permitir ventanas flotantes anidadas
      preview_window_title = { enable = true, position = "left" }, -- Mostrar el título de la ventana de vista previa con el nombre del archivo
      zindex = 1,                                                  -- Índice Z inicial para la pila de ventanas flotantes
    })
  end,
}
