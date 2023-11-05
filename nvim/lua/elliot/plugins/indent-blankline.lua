return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function ()
		local ibl = require("ibl")
		ibl.setup({
			scope = { -- Doesn't work for some reason
				enabled = true,
				show_end = false,
				show_start = false,
			},
		})
	end,
}
