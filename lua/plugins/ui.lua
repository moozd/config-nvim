local Util = require("moozd.util")

return {
  {
    "rcarriga/nvim-notify",
    enabled = false,
    init = function()
      Util.load_plugin_with_func("nvim-notify", vim, "notify")
    end,
  },
  {
    "stevearc/dressing.nvim",

    init = function()
      Util.load_plugin_with_func("dressing.nvim", vim.ui, { "input", "select" })
    end,

    opts = {
      input = { default_prompt = "-> " },
      select = {
        backend = { "telescope", "builtin" },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      sources = { "filesystem", "buffers", "git_status" },
      follow_current_file = true,
      config = function()
        require("neo-tree").close_all()
      end,
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
      source_selector = {
        winbar = false,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = Util.get_icon("FolderClosed", 1) .. "File" },
          -- { source = "buffers", display_name = Util.get_icon("DefaultFile", 1) .. "Bufs" },
          -- { source = "git_status", display_name = Util.get_icon("Git", 1) .. "Git" },
          -- { source = "diagnostics", display_name = Util.get_icon("Diagnostic", 1) .. "Diagnostic" },
        },
      },
      default_component_configs = {
        modified = {
          symbol = Util.icons.FileModified,
          highlight = "NeoTreeModified",
        },
        git_status = {
          symbols = {
            -- Change type
            added = Util.icons.GitAdd, -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = Util.icons.GitChange, -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = Util.icons.GitDelete, -- this can only be used in the git_status source
            renamed = Util.icons.GitRenamed, -- this can only be used in the git_status source
            -- Status type
            untracked = Util.icons.GitUntracked,
            ignored = Util.icons.GitIgnored,
            unstaged = Util.icons.GitUnstaged,
            staged = Util.icons.GitStaged,
            conflict = Util.icons.GitConflict,
          },
        },
      },

      filesystem = {
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = "open_current",
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      window = {
        position = "left",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
