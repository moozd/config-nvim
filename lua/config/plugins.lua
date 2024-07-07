return {
  -- core
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },

    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        incremental_selection = { enable = true },
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls.nvim",
      "simrat39/rust-tools.nvim",
      "folke/neoconf.nvim",
      "folke/neodev.nvim",
      -- "davidmh/cspell.nvim",
    },
    config = function()
      require("neoconf").setup({})
      require("mason").setup({})
      require("mason-lspconfig").setup({})
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          if server_name == "volar" then
            require("lspconfig").volar.setup({
              filetypes = { "vue" },
              init_options = {
                vue = {
                  hybridMode = false,
                },
                typescript = {
                  tsdk = vim.fn.getcwd() .. "node_modules/typescript/lib",
                },
              },
            })
          elseif require("lspconfig")[server_name] then
            require("lspconfig")[server_name].setup({})
          end
        end,
      })

      -- local cspell = require("cspell")
      require("null-ls").setup({
        -- sources = {
        --   cspell.diagnostics,
        --   cspell.code_actions,
        -- },
      })
      require("mason-null-ls").setup({
        handlers = {
          function(source_name, methods)
            require("mason-null-ls").default_setup(source_name, methods)
          end,
        },
      })

      require("rust-tools").setup({})
    end,
  },
  -- {
  --   "L3MON4D3/LuaSnip",
  --   build = true,
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --     config = function()
  --       require("luasnip.loaders.from_vscode").lazy_load()
  --     end,
  --   },
  --   opts = {
  --     history = true,
  --     delete_check_events = "TextChanged",
  --   },
  -- },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      -- "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,select",
        },
        -- snippet = {
        --   expand = function(args)
        --     require("luasnip").lsp_expand(args.body)
        --   end,
        -- },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
        }),
        sources = cmp.config.sources({
          -- { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "vim-dadbod-completion" },
        }),
      })

      -- local ls = require("luasnip")
      -- ls.config.set_config({
      --   history = false,
      --   updateevents = "TextChanged,TextChangedI",
      -- })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
  },

  --- ui
  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        border = "none",
      },
      select = {
        backend = "telescope",
        border = "none",
        telescope = nil,
      },
    },
  },

  -- code editig tools
  {
    "folke/trouble.nvim",
    opts = {},
  },
  { "tpope/vim-fugitive" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          local prefix = require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          if vim.o.filetype == "sql" then
            prefix = "-- %s"
          end
          return prefix
        end,
      },
    },
  },
  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup()
    end,
  },

  ------------------ misc
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/telescope-git-browse.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        theme = "ivy",
        shorten_path = true,
        defaults = vim.tbl_extend("force", require("telescope.themes").get_ivy(), {
          file_ignore_patterns = {
            "node_modules",
          },
        }),
      })

      telescope.load_extension("git_browse")
    end,
  },

  {
    "stevearc/overseer.nvim",
    opts = {},
    config = function()
      require("overseer").setup()
    end,
  },

  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      })
    end,
  },

  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({})
    end,
  },
  {
    "DreamMaoMao/yazi.nvim",
  },
  {
    "kawre/leetcode.nvim",
    lazy = false,
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lang = "python3", -- configuration goes here
    },
  },
}
