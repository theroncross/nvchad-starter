return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "eslint",
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "prettier",
        "ember-language-server",
        "marksman",
      },
    },
  },

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
        "norg",
        "typescript",
        "vim",
        "marksman",
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

  {
    "max397574/better-escape.nvim",
    enabled = false,
  },

  { "tpope/vim-fugitive", lazy = false },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      lazy = false,
      branch = "canary",
      dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      },
      opts = {},
    },
  },

  { "christoomey/vim-tmux-navigator", lazy = false },
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

  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth", lazy = false },
}
