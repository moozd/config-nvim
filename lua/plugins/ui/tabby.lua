return function()
  local palette = {
    fg_active = "#cdd6f4",
    fg_inactive = "#585b70", -- fg3
  }

  local filename = require("tabby.filename")

  local buficon = function(winid)
    local buf = vim.api.nvim_win_get_buf(winid)
    local file_icon = ""

    if vim.api.nvim_buf_get_option(buf, "modified") then
      file_icon = ""
    end

    return file_icon
  end

  local line = {
    hl = "Normal",
    layout = "active_wins_at_tail",
    head = { { " " } },
    active_tab = {
      label = function()
        return {
          "󰹞",
          hl = { fg = "#a6e3a1", style = "bold" },
        }
      end,
    },
    inactive_tab = {
      label = function()
        return {
          "󰹞",
          hl = { fg = palette.fg_inactive },
        }
      end,
    },
    top_win = {
      label = function(winid)
        return {
          buficon(winid) .. " " .. filename.unique(winid) .. "  ",
          hl = { fg = palette.fg_active, style = "bold" },
        }
      end,
    },
    win = {
      label = function(winid)
        return {
          buficon(winid) .. " " .. filename.unique(winid) .. "  ",
          hl = { fg = palette.fg_inactive },
        }
      end,
    },
  }
  require("tabby").setup({ tabline = line })
end
