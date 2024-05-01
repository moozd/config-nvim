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
}
