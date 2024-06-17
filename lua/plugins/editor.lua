return {
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup()
    end,
  },

  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      -- vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    submodules = false, -- not needed, submodules are required only for tests

    -- you can specify also another config if you want
    config = function()
      require("gx").setup({
        open_browser_app = "xdg-open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
        handlers = {
          plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true, -- open github issues
          brewfile = true, -- open Homebrew formulaes and casks
          package_json = true, -- open dependencies from package.json
          search = true, -- search the web/selection on the web if nothing else is found
        },
        handler_options = {
          search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
        },
      })
    end,
  },
  --- syntax
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
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Select Cursor Down"] = "<M-C-Down>",
        ["Select Cursor Up"] = "<M-C-Up>",
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    config = function()
      require("colorizer").setup({}, { names = false })
    end,
  },
  --- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    enabled = false, -- i can't use this in the terminal
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  --- comments
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
    config=function ()
        require("mini.ai").setup()
    end
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
    icons = { group = "#", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
    -- init = function() end,
    opts = {
      motions = {
        count = true,
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = " ", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
      },
    },

    config = function(_, opts)
      require("which-key").setup(opts)
      require("moozd.util").which_key_register()
    end,
  },
}
