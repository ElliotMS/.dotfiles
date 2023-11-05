return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter")
		
		configs.setup({
			ensure_installed = {
				"lua",
				"rust",
				"java",
				"python",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
