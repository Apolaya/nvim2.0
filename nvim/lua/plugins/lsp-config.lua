return {
		
	
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ruff_lsp", "ruff", "jedi_language_server" },
				opts = {
					auto_install = true, 
				}
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilites = capabilities
			})

			lspconfig.ruff_lsp.setup({
				capabilities = capabilities
			})
			lspconfig.ruff.setup({
				capabilities = capabilities
			})
			lspconfig.jedi_language_server.setup({
				capabilites = capabilities
			})

			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- vim.kyemap.set('n', " <leader>gd", vim.lsp.buf.references, {})
		end,
	},
}
