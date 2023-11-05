return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function ()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "gruvbox_dark",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { },
				lualine_z = { "location" }
			},
		})
	end
}
