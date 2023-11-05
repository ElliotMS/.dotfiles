local lsp_table = {
	"lua_ls",
	"rust_analyzer",
	"jdtls",
}

return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"folke/neodev.nvim"
	},
	config = function()
		local lsp = require("lsp-zero")
		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({buffer = bufnr})
		end)

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = lsp_table,
			handlers = { lsp.defualt_setup },
		})

		local cmp = require("cmp")
		cmp.setup({
			cmp_select = { behavior = cmp.SelectBehavior.Select },
			mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
		})
		
		local neodev = require("neodev")
		neodev.setup({})

		lsp.setup_servers(lsp_table)
	end,
}


