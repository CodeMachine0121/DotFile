local util = require("util")

return {
	{ "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },

	-- Add C# to treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				util.list_insert_unique(opts.ensure_installed, "c_sharp")
			end
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "netcoredbg", "csharpier" })
			end
		end,
	},

	-- Correctly setup lspconfig  🚀
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- Ensure mason installs the server
				omnisharp = {},

				volar = function()
					require("lazyvim.util").lsp.on_attach(function(client, _)
						if client.name == "volar" then
							client.server_capabilities.documentFormattingProvider = false
						end
					end)
				end,
			},
			-- configure omnisharp to fix the semantic tokens bug (really annoying)
			setup = {
				omnisharp = function(_, _)
					require("lazyvim.util").on_attach(function(client, _)
						if client.name == "omnisharp" then
							---@type string[]
							local tokenModifiers =
								client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
							for i, v in ipairs(tokenModifiers) do
								tokenModifiers[i] = v:gsub(" ", "_")
							end
							---@type string[]
							local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
							for i, v in ipairs(tokenTypes) do
								tokenTypes[i] = v:gsub(" ", "_")
							end
						end
					end)
					return false
				end,
			},
		},
	},
}
