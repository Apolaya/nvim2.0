-- Treesitter plugin
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		local configs = require("nvim-treesitter.configs")
		-- using this config variable setting config for tree sitter.
		configs.setup({
			ensure_installed = {'lua', 'python'},
			auto_install = true,

			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
