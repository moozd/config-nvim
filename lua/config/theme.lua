vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "StatusLine", { fg = "#1e212e", bg = "#94e2d5", bold = false })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#1e212e", bg = "#6c7086", italic = false })

vim.cmd("highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineOk cterm=undercurl gui=undercurl")

function UD_status_line_current_mode()
  local modes = {
    n = "NORMAL",
    no = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    [""] = "V-BLOCK",
    c = "COMMAND",
    R = "REPLACE",
    Rv = "V-REPLACE",
    s = "SELECT",
    S = "S-LINE",
    [""] = "S-BLOCK",
    t = "TERMINAL",
    ["!"] = "SHELL",
  }

  local mode_code = vim.api.nvim_get_mode().mode
  return modes[mode_code] or "UNKNOWN"
end

function UD_recording_macro()
  local reg_recording = vim.fn.reg_recording()
  if reg_recording ~= "" then
    return "recording @" .. reg_recording
  else
    return ""
  end
end

-- Set the statusline to include the current mode
-- vim.opt.showcmdloc = "statusline"
-- vim.opt.showmode = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.statusline:append(" ")
if vim.opt.showmode == false then
  vim.opt.statusline:append("%{v:lua.UD_status_line_current_mode()} ")
end
vim.opt.statusline:append("%f ")
vim.opt.statusline:append("%m ")
vim.opt.statusline:append("%r ")
vim.opt.statusline:append("%= ")
if vim.opt.showcmdloc == "statusline" then
  vim.opt.statusline:append("%{v:lua.UD_recording_macro()}    ")
  vim.opt.statusline:append("%S    ")
end
vim.opt.statusline:append("%-13.(%l,%c%V%) %P")
vim.opt.statusline:append(" ")
