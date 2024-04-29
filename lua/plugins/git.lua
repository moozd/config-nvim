local icons = require("moozd.util").icons
return {
  -- {
  --   "airblade/vim-gitgutter",
  --   init = function()
  --     vim.g.gitgutter_map_keys = 0
  --   end,
  -- },
  --
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = icons.GitAdd },
          change = { text = icons.GitChange },
          delete = { text = icons.GitDelete },
          topdelete = { text = icons.GitDelete },
          changedelete = { text = icons.GitChange },
          untracked = { text = icons.GitUntracked },
        },

        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_formatter = icons.Git .. " <author>, <author_time:%R> - <summary>",
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
      })
    end,
  },
}
