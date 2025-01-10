local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      "zenbones-theme/zenbones.nvim",
      -- Optionally install Lush. Allows for more configuration or extending the colorscheme
      -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
      -- In Vim, compat mode is turned on as Lush only works in Neovim.
      dependencies = "rktjmp/lush.nvim",
      lazy = false,
      priority = 1000,
      -- you can set set configuration options here
      -- config = function()
      --     vim.g.zenbones_darken_comments = 45
      --     vim.cmd.colorscheme('zenbones')
      -- end
    },
    {
      "projekt0n/github-nvim-theme",
      name = "github-theme",
      lazy = false,
      priority = 1000,
    },
    {
      "sainnhe/sonokai",
      priority = 1000,
      lazy = false,
      init = function()
        vim.g.sonokai_style = "andromeda"
      end,
    },
    {
      "morhetz/gruvbox",
      priority = 1000,
      lazy = false,
    },
    {
      "nlknguyen/papercolor-theme",
      priority = 1000,
      lazy = false,
    },
    {

      "exb/minimo",
      priority = 1000,
      lazy = false,
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
    },
    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        require("rose-pine").setup({
          styles = {
            bold = true,
            italic = false,
          },
        })
      end,
    },
    {
      import = "config.plugins",
    },
  },

  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  change_detection = {
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
