return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Ui 
  {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      require("configs.startup")
    end,
    lazy = false
  },
  {
    "rebelot/kanagawa.nvim",
    config = function ()
     require "configs.kanagawa"
    end,
    lazy = false
  },
  {
    "mortepau/codicons.nvim",
    lazy = false
  },

	{
		"nvim-tree/nvim-web-devicons",
    lazy = false
	},
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require('ibl').setup({})
    end,
    lazy = false
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "benfowler/telescope-luasnip.nvim",
      -- 添加 jsregexp 依賴
      {
        "nvim-lua/plenary.nvim",
      },
      {
        "kikito/inspect.lua",
      },
      {
        "hrsh7th/nvim-cmp",
      },
      {
        "onsails/lspkind.nvim",
      },
    },
    config = function()
      require "configs.lspconfig"
    end,
    lazy = false
  },
  {
		"nvimtools/none-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim" },
    lazy = false,
	},
  {
    "nvimtools/none-ls-extras.nvim",
    lazy = false,
  },
  {
    "onsails/lspkind-nvim",
    lazy = false,
  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("configs.glance")
    end,
    lazy = false
  },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
    lazy = false,
		requires = { { "nvim/lua/plenary.nvim" } },
    config = function()
      require("configs.telescope")
    end,
	},
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    lazy = false,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
  },

  -- cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
    lazy = false,
	},
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
  },
	{
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
    lazy = false
  },
	{
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
    lazy = false
  },

	-- Mason: Portable package manager
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
    lazy = false
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
		require("configs.mason-lsp")
		end,
		after = "mason.nvim",
    lazy = false
	},

  -- folder explorer
  {
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
    lazy = false
	},
  {
    "MunifTanjim/nui.nvim"
  },
  -- sync hightlight
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
    lazy = false
  },

  -- show color on nvim
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
    lazy = false
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("configs.toggleterm")
			vim.opt.termguicolors = true
		end,
    lazy = false
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
    lazy = false
	},
  {
    'f-person/git-blame.nvim',
    lazy = false,
    config = function ()
      require('gitblame').setup({
        enabled = true,
      })
    end
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
  },

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
    lazy = false
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
    lazy = false
	},

	-- auto save
	{
    "https://github.com/pocco81/auto-save.nvim",
    lazy = false
  },

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    },
    config = function()
      require("configs.refactoring")
    end,
    lazy = false
  },

  -- expend selection
  {
    'terryma/vim-expand-region',
    lazy = false
  },

  -- easy motion
  {
    'easymotion/vim-easymotion',
    lazy = false
  },

  -- Trouble 
  {
    "folke/trouble.nvim",
    requires = "nvim-web-devicons",
    config = function()
      require("configs.trouble")
    end,
    lazy = false
  },
  {
    "ivanjermakov/troublesum.nvim",
    config = function()
      require("configs.troublesum")
    end,
    lazy = false
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function ()
     require("configs.luasnippest")
    end,
    lazy = false
  },

  -- dap
  require("plugins.JavscriptDapper"),

  {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",  -- 確保 nvim-dap 已經安裝
    },
    config = function()
      require('configs.dap-ui')
    end,
    lazy = false,
  },

}
