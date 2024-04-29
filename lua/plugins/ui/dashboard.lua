local M = {}

function M.opts()
  local dashboard = require("alpha.themes.dashboard")
  local header = {
    " ─────────── 󰁔   ────────────── 󰁔 󰉚 ─────────── 󰁔  ",
    "                      NeoVim                        │",
    "└────────────────────────────────────────────────────┘",
  }

  local footer = { "" }

  dashboard.section.header.val = header
  dashboard.section.footer.val = footer
  dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("l", "?" .. " Leet", ":Leet<CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  }
  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaHeader"
    button.opts.hl_shortcut = "AlphaHeader"
  end
  dashboard.section.header.opts.hl = "AlphaHeader"
  dashboard.section.buttons.opts.hl = "AlphaButtons"
  dashboard.section.footer.opts.hl = "AlphaHeader"
  dashboard.opts.layout[1].val = 8
  return dashboard
end

function M.config(_, dashboard)
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        require("lazy").show()
      end,
    })
  end

  require("alpha").setup(dashboard.opts)
end

return M
