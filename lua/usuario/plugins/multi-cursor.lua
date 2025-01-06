return {
  {
    "terryma/vim-multiple-cursors",
    lazy = false, -- Asegúrate de cargarlo inmediatamente
    config = function()
      -- Opcional: Configuración personalizada si necesitas
      vim.g.VM_default_mappings = true -- Habilita las combinaciones de teclas por defecto
    end,
  },
}
