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
        theme = "ivy",
        shorten_path = true,
        defaults = vim.tbl_extend(
          "force",
          require("telescope.themes").get_ivy(), -- or get_cursor, get_ivy
          {
            file_ignore_patterns = {
              "node_modules",
            },
          }
        ),
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("git_browse")
      telescope.load_extension("git_signs")
    end,
  },
}
