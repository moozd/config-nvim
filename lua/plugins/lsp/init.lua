
local lsp = require("plugins.lsp.lsp") 
return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "folke/neodev.nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "nvimtools/none-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
      "folke/neoconf.nvim",
      "folke/neodev.nvim",
      "simrat39/rust-tools.nvim",
    },
    config = lsp.configure
  },
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", group_index = 1, priority = 1500 },
          { name = "luasnip", group_index = 2, priority = 20 },
          { name = "codeium" },
          { name = "path", group_index = 3, keyword_length = 1, priority = 10 },
          { name = "buffer", group_index = 4, keyword_length = 5, priority = 0 },

          { name = "vim-dadbod-completion", priority = 1500 },
          { name = "gitmoji", priority = 5 },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            preset = "codicons",
          }),
        },
      }
    end,
  },
  {
    "Dynge/gitmoji.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    opts = { -- the values below are the defaults
      filetypes = { "gitcommit" },
      completion = {
        append_space = false,
        complete_as = "emoji",
      },
    },
    ft = "gitcommit",
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}