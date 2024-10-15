return {
  --ai
  {
    "codethenpizza/lazy-llama",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("lazy-llama").setup({
        url = "http://127.0.0.1:11434", -- default URL
        model = "deepseek-llm", -- default model
        stream = true, -- enable streaming by default
      })
    end,
  },
  {
    "davidmh/mdx.nvim",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "dgagn/diagflow.nvim",
    -- event = 'LspAttach', This is what I use personnally and it works great
    opts = {
      placement = "top",
      scope = "line",
    },
  },
  -- core
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },

    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "go",
          "lua",
          "markdown",
          "markdown_inline",
          "vimdoc",
        },
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        incremental_selection = { enable = true },
      })

      -- vim.filetype.add({
      -- 	extension = {
      -- 		mdx = "mdx",
      -- 	},
      -- })

      vim.filetype.add({
        pattern = {
          [".*/templates/.*%.yaml"] = "helm",
        },
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
      "davidmh/cspell.nvim",
    },
    config = function()
      require("neoconf").setup({})
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "eslint@4.8.0",
        },
      })
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

      local cspell = require("cspell")
      local cspell_config = {
        config_file_preferred_name = "cspell.json",
        find_json = function()
          local p = vim.env.HOME .. "/.config/nvim/cspell.json"
          return p
        end,
      }
      require("null-ls").setup({
        sources = {
          cspell.diagnostics.with({
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity["HINT"]
            end,
            diagnostic_config = {
              virtual_text = false,
            },
            config = cspell_config,
          }),
          cspell.code_actions.with({
            config = cspell_config,
          }),
        },
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
  {
    "topaxi/gh-actions.nvim",
    lazy = false,
    keys = {
      { "<leader>gh", "<cmd>GhActions<cr>", desc = "Open Github Actions" },
    },
    -- optional, you can also install and use `yq` instead.
    build = "make",
    ---@type GhActionsConfig
    opts = {},
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,select",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "vim-dadbod-completion" },
        }),
      })
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

  -- code editing tools
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
  { "akinsho/toggleterm.nvim", version = "*", config = true },
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
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        defaults = vim.tbl_extend("force", require("telescope.themes").get_ivy(), {
          file_ignore_patterns = {
            "node_modules",
            ".git",
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
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        auto_clean_after_session_restore = false,
        event_handlers = {

          {
            event = "file_open_requested",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
        filesystem = {

          window = {
            position = "right",
            height = "30",
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
      })
    end,
  },
  {
    "kawre/leetcode.nvim",
    lazy = false,
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lang = "python3", -- configuration goes here
    },
  },
}
