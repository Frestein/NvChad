return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function()
      return require "configs.mason"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "configs.treesitter"
    end,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "fladson/vim-kitty",
    event = "BufEnter */kitty.conf",
  },

  {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    config = function()
      require "configs.silicon"
    end,
  },

  {
    "Wansmer/langmapper.nvim",
    lazy = false,
    priority = 1, -- High priority is needed if you will use `autoremap()`
    config = function()
      require "configs.langmapper"
    end,
  },
}