return {
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require('aerial').setup({
      default_direction = "right",
      layout = {
        min_width = 30,
        max_width = 50,
        default_direction = "right",
        preserve_equality = false,
      },
      close_automatic_events = {}, -- No cerrar automáticamente en eventos específicos
      manage_folds = false,        -- Evita conflictos con otras configuraciones de pliegues
      attach_mode = "global",      -- No recargar Aerial al cambiar de buffer
    })
  end
}
