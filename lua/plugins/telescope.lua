return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/telescope-git-browse.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "lewis6991/gitsigns.nvim",
      "radyz/telescope-gitsigns",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        theme = "dropdown",
        shorten_path = true,
        defaults = {
          file_ignore_patterns = {
            "node_modules",
          },
        },
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("git_browse")
      telescope.load_extension("git_signs")
    end,
  },
}
