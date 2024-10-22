-- Automatically run: PackerCompile
--
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	-- Packer
	use({
		"wbthomason/packer.nvim",
		init = function()
			vim.opt.termguicolors = true
		end,
	})

	-- Common utilities
	use("nvim-lua/plenary.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Colorschema
	use("rebelot/kanagawa.nvim")
	use("navarasu/onedark.nvim")
	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
		requires = { "nvim-web-devicons" },
	})

	--Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("configs.treesitter")
		end,
	})

	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim/lua/plenary.nvim" } },
    config = function()
      require("configs.telescope")
    end,
	})
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
  use{
    "nvim-telescope/telescope-ui-select.nvim"
  }

	-- Lsp
	use({
  	"neovim/nvim-lspconfig",
 		config = function()
 			require("configs.lsp")
 		end,
 	})
  --
	use({
    "onsails/lspkind-nvim",
  })
	use({
		"L3MON4D3/LuaSnip",
	})

	-- LSP diagnostics, code actions, and more via Lua.
	use({
		"nvimtools/none-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim" },
	})

	-- cmp: Auto complete
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

	-- Mason: Portable package manager
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
--
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
		require("configs.mason-lsp")
		end,
		after = "mason.nvim",
	})

	-- File manager
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})

	-- Show colors
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("configs.toggleterm")
			vim.opt.termguicolors = true
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	})

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	})

	-- Background Transparent
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("configs.transparent")
		end,
	})

	-- auto save
	--use("https://github.com/pocco81/auto-save.nvim")

  -- Refactoring
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    },
    config = function()
      require("configs.refactoring")
    end,
  }

  -- extend selection
  use {
    'terryma/vim-expand-region',
    config = function()
      --require("configs.expand-region")
    end,

  }

  -- easy motion
  use {
    'easymotion/vim-easymotion',
  }

  -- glance, code moving 
  use {
    "dnlhc/glance.nvim",
    config = function()
      require("configs.glance")
    end,
  }

  -- trouble 
  use {
    "folke/trouble.nvim",
    requires = "nvim-web-devicons",
    config = function()
      require("configs.trouble")
    end,
  }

  -- trouble sum: show sum of error warning
  use {
    "ivanjermakov/troublesum.nvim",
    config = function()
      require("configs.troublesum")
    end,
  }

  -- buffer line
  use {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("configs.bufferline")
    end,
  }
  
  -- comment
  use{
    "numToStr/Comment.nvim",
    configs = function()
      require("Comment").setup({})
    end,
  }


end)
