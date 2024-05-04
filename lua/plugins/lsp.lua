-- local cspell_path = vim.env.HOME .. "/.config/nvim/.cspell.json"

local function setup_lsp()
  -- require("neoconf").setup({})
  local null_ls = require("null-ls")
  require("mason").setup({})

  require("mason-lspconfig").setup({})
  require("mason-lspconfig").setup_handlers({
    function(server_name)
      if server_name == "volar" then
        require("lspconfig").volar.setup({
          filetypes = {  "vue" },
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

  null_ls.setup({})
  require("mason-null-ls").setup({
    handlers = {
      function(source_name, methods)
        require("mason-null-ls").default_setup(source_name, methods)
      end,
    },
  })
end

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      -- { "folke/neodev.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "nvimtools/none-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
      "folke/neoconf.nvim",
    },
    config = setup_lsp,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({})
    end,
  },
  { "folke/neodev.nvim", opts = {} },
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
      local compare = require("cmp.config.compare")
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
        -- sorting = {
        --     priority_weight = 1.0,
        --     comparators = {
        --         compare.locality,
        --         compare.exact,
        --         compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
        --         compare.kind,
        --         compare.order,
        --         compare.recently_used,
        --         compare.offset,
        --     },
        -- },
      }
    end,
  },
  {
    "Dynge/gitmoji.nvim",
    enabled = false,
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
  -- {
  --   "notjedi/nvim-rooter.lua",
  --   config = function()
  --     require("nvim-rooter").setup()
  --   end,
  -- },
}
