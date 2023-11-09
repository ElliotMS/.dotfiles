return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function ()
		local nvimtree = require("nvim-tree")
		nvimtree.setup({
			view = { side = "left" },
		})
	end
}
