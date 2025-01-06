vim.opt.number = true         -- Mostrar números de línea
vim.opt.relativenumber = true -- Mostrar números de línea relativos
vim.opt.signcolumn = 'yes:2'
-- tabs & identation
vim.opt.tabstop = 2        -- Número de espacios que un tab ocupa
vim.opt.shiftwidth = 2     -- Tamaño del indentado
vim.opt.expandtab = true   -- Convertir tabs en espacios
vim.opt.smartindent = true -- Habilitar indentado inteligente
vim.opt.autoindent = true  -- Copia nivel de sagria de la linea actual a la siguiente
vim.opt.wrap = false       -- No ajustar las líneas
vim.opt.scrolloff = 8      -- Mantener un margen al hacer scroll

-- search settings
vim.opt.ignorecase = true -- No distinge entre mayusculas y minusculas
vim.opt.smartcase = true  -- Pero si uso mayusculas y minusuclas mixtas, volvere a distingir las mayusuculas y minusculas
vim.opt.cursorline = true -- Linea en el cursor
vim.opt.hlsearch = true   -- Resaltar búsquedas
vim.opt.incsearch = true  -- Buscar mientras se escribe

-- backspace
vim.opt.backspace = "indent,eol,start" -- Backspace funcione como es de esperar

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- slipt windows
vim.opt.splitright = true -- Dividir hacia la ventana de la derecha
vim.opt.splitbelow = true -- Dividir hacia abajo

-- termguicolors
vim.opt.termguicolors = true -- Habilitar colores en el terminal

-- archivos de intercambio
vim.opt.swapfile = false -- No crear archivos de intercambio
vim.opt.backup = false   -- No crear archivos de backup

vim.opt.signcolumn = 'yes'
