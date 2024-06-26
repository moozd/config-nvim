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
    { import = "config.plugins" },
    {
      -- "catppuccin/nvim",
      -- name = "catppuccin",
      "sainnhe/gruvbox-material",
      priority = 1000,
      init=function ()
        vim.g.gruvbox_material_background ='hard'
      end,
      config = function()
        vim.cmd.colorscheme("gruvbox-material")
        require("config.theme"):new():setup({ hl = { transparent = false } })
      end,
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
