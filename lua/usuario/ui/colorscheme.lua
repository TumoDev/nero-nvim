return {
  {
    "navarasu/onedark.nvim",
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    "zaldih/themery.nvim",
    config = function()
      require("themery").setup({
        themes = {
          { name = "One Dark",             colorscheme = "onedark" },
          { name = "Tokyo Night",          colorscheme = "tokyonight" },
          { name = "Tokyo Night Storm",    colorscheme = "tokyonight-storm" },
          { name = "Tokyo Night Night",    colorscheme = "tokyonight-night" },
          { name = "Tokyo Night Day",      colorscheme = "tokyonight-day" },
          { name = "Tokyo Night Moon",     colorscheme = "tokyonight-moon" },
          { name = "Catppuccin Latte",     colorscheme = "catppuccin-latte" },
          { name = "Catppuccin Frappe",    colorscheme = "catppuccin-frappe" },
          { name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
          { name = "Catppuccin Mocha",     colorscheme = "catppuccin-mocha" },
        },
        live_preview = true, -- Vista previa en vivo al seleccionar
        persist = true,      -- Persistir el tema seleccionado
      })
    end,
  },
}
