return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { "williamboman/mason.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "css",
        "glimmer",
        "glimmer_javascript",
        "glimmer_typescript",
        "html",
        "javascript",
        "lua",
        "markdown",
        -- "norg",
        "typescript",
        "vim",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "v",
          node_decremental = "V",
        },
      },
    },
  },

  -- Show context as top line
  { "nvim-treesitter/nvim-treesitter-context", opts = {} },

  -- prefer oil
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { "tpope/vim-fugitive", lazy = false },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Mapping tab is already used by NvChad
      vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_no_tab_map = true
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        completeopt = "menu,noselect,noinsert",
      },
      mapping = {
        ["<CR>"] = require("cmp").mapping.confirm {
          behavior = require("cmp").ConfirmBehavior.Replace,
          select = false,
        },
        ["<Tab>"] = require("cmp").mapping.abort(),
        ["<Down>"] = require("cmp").mapping.select_next_item(),
        ["<Up>"] = require("cmp").mapping.select_prev_item(),
      },
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth", lazy = false },
}
