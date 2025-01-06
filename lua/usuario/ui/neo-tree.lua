return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    -- "3rd/image.nvim", -- Descomenta esta línea si necesitas soporte para imágenes en la ventana de vista previa
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Cierra Neo-tree si es la última ventana en la pestaña
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 0, -- Ajusta el espacio entre el ícono y el nombre del archivo
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        name = {
          use_git_status_colors = false, -- Desactiva los colores según el estado de Git
          highlight = "",                -- Elimina el resaltado del texto del nombre de archivo
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          default = "",
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = " ", -- Símbolo para indicar archivos modificados
          highlight = "NeoTreeModified",
        },
        git_status = {
          symbols = {
            added     = "✚ ",
            modified  = "● ",
            deleted   = "✖ ",
            renamed   = "󰁕 ",
            untracked = "? ", -- Archivos no rastreados
            ignored   = "◌ ", -- Archivos ignorados por .gitignore
            unstaged  = "✗ ", -- Cambios no confirmados
            staged    = "✓ ", -- Cambios listos para confirmación
            conflict  = " ", -- Archivos en conflicto
          },
        },
        diagnostics = {
          symbols = {
            hint = "󰌵 ",
            info = "  ",
            warn = "  ",
            error = "  ",
          },
          highlights = {
            hint = "DiagnosticSignHint",
            info = "DiagnosticSignInfo",
            warn = "DiagnosticSignWarn",
            error = "DiagnosticSignError",
          }
        },
      },
      window = {
        position = "right", -- Posicion de la ventana de Neo-tree
        width = 40,         -- Ajusta el ancho de la ventana de Neo-tree
        mappings = {
          ["<space>"] = "toggle_node",
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["a"] = { "add", config = { show_path = "none" } },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
      buffers = {
        follow_current_file = { enabled = true },
        group_empty_dirs = true,
        show_unloaded = true,
      },
    })

    -- Mapeo para abrir Neo-tree con la tecla \
    vim.api.nvim_set_keymap('n', '\\', ':Neotree reveal<CR>', { noremap = true, silent = true })
  end,
}
