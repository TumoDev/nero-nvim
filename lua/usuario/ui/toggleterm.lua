return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20, -- tamaño de la terminal cuando se despliega
			direction = "float", -- cambiar a 'horizontal', 'vertical' o 'float'
			float_opts = {
				border = "curved", -- opciones: 'single', 'double', 'shadow', 'curved'
			},
		})
	end,
}
