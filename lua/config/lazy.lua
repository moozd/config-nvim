local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { "rktjmp/lush.nvim",                 lazy = false },
    { "ribru17/bamboo.nvim",              lazy = false },
    { "JoosepAlviste/palenightfall.nvim", lazy = false },
    -- { "rafi/awesome-vim-colorschemes", lazy = false },
    { "catppuccin/nvim",                  lazy = false },
    { "folke/tokyonight.nvim",            lazy = false },
    { "agude/vim-eldar",                  lazy = false },
    { "olimorris/onedarkpro.nvim",        priority = 1000 }, -- Ensure it loads first}
    -- { "dracula/vim",                   lazy = false },
    -- { "loctvl842/monokai-pro.nvim",    lazy = false },
    -- { "Yazeed1s/minimal.nvim",         lazy = false },
    -- { "savq/melange-nvim",             lazy = false },
    -- {"metalelf0/jellybeans-nvim",lazy=false},
    --
    -- {
    --    "folke/tokyonight.nvim",
    --    lazy = false,
    --    priority = 1000,
    --    opts = {},
    --  },
    --  {"briones-gabriel/darcula-solid.nvim", lazy=false ,dependecies = {"rktjmp/lush.nvim"}},
    --  {
    --    "ray-x/starry.nvim",
    --    lazy = false,
    --    init = function()
    --      vim.g.starry_italic = true
    --
    --      vim.g.starry_italic_comments = true
    --      vim.g.starry_italic_string = false
    --      vim.g.starry_italic_functions = false
    --      vim.g.starry_italic_variables = false
    --      vim.g.starry_italic_keywords = true
    --      vim.g.starry_italic_functions = false
    --
    --      vim.g.starry_contrast = true
    --      vim.g.starry_borders = false
    --      vim.g.starry_disable_background = false
    --      vim.g.starry_style_fix = true
    --      vim.g.starry_darker_contrast = true
    --      vim.g.starry_deep_black = false
    --      vim.g.starry_set_hl = false
    --      vim.g.starry_daylight_switch = false
    --    end,
    --  },
    { import = "plugins" },
  },

  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false,                             -- get a notification when changes are found
  },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
