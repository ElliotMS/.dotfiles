return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		gruvbox = require("gruvbox")
		gruvbox.setup({
			contrast = "hard"
		})
		vim.cmd([[colorscheme gruvbox]])
	end,

}
