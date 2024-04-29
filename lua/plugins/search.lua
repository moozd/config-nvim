return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/telescope-git-browse.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "lewis6991/gitsigns.nvim",
      "camgraff/telescope-tmux.nvim",
      "radyz/telescope-gitsigns",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        theme = "cursor",
        shorten_path = true,
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("git_browse")
      telescope.load_extension("git_signs")
      telescope.load_extension("tmux")
    end,
  },

  {
    "LukasPietzschmann/telescope-tabs",
    config = function()
      require("telescope").load_extension("telescope-tabs")
      require("telescope-tabs").setup({
        -- Your custom config :^)
      })
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  { "nvim-pack/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf", build = "./install --bin" },
  },
}
