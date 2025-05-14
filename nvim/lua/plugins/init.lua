return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
    lazy = false
  },
  -- UI
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").setup({})
    end,
    lazy = false
  },
  {
    "echasnovski/mini.animate",
    lazy = false,
    config = function()
      require("configs.animate")
    end
  },
  {
    "echasnovski/mini.indentscope",
    lazy = false,
    config = function()
      require("configs.indentscope")
    end
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
      vim.api.nvim_command("WindowsEnableAutowidth")
    end,
    lazy = false
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
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
    config = function()
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

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require("configs.refactoring")
    end,
    lazy = false
  },


  -- editor
  {
    'terryma/vim-expand-region',
    lazy = false
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("configs.autopairs")
    end,
    lazy = false
  },
  {
    "https://github.com/pocco81/auto-save.nvim",
    lazy = true
  },
  {
    'easymotion/vim-easymotion',
    lazy = false
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
      require("configs.luasnippest")
    end,
    lazy = false
  },

  -- devcontainer
  {
    'https://codeberg.org/esensar/nvim-dev-container',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    },
    lazy = false,
    config = function()
      require("configs.devcontainer")
    end,
  },

  -- AI
  {
    "yetone/avante.nvim",
    config = function()
      require('configs.avante')
    end,
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",         -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",        -- for providers='copilot'
    },
  },
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false
  }
}
