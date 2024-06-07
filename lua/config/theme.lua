vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "StatusLine", { fg = "#1e212e", bg = "#b4befe", bold = false })
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
vim.opt.showcmdloc = "statusline"
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.laststatus = 2
vim.opt.statusline = " %{v:lua.UD_status_line_current_mode()}   %f %m %r %= %{v:lua.UD_recording_macro()}    %S    %-13.(%l,%c%V%) %P "
