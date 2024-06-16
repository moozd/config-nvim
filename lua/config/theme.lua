Theme = {}

function Theme:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Theme:create_highlight_groups()
  local h = vim.api.nvim_set_hl
  -- Diagnostic
  h(0, "DiagnosticUnderlineOk", { undercurl = true })
  h(0, "DiagnosticUnderlineInfo", { undercurl = true })
  h(0, "DiagnosticUnderlineWarn", { undercurl = true })
  h(0, "DiagnosticUnderlineHint", { undercurl = true })
  h(0, "DiagnosticUnderlineError", { undercurl = true })

  -- interface
  h(0, "Normal", { bg = "None" })
  h(0, "NormalNC", { bg = "None" })
  h(0, "LineNr", { bg = "None" })
  h(0, "SignColumn", { bg = "None" })
  h(0, "StatusLine", { bg = "#181825", bold = true })

  -- Syntax
  -- h(0, "Statement", { fg = "#f38ba8" })
  -- h(0, "Function", { fg = "#89b4fa" })
  -- h(0, "String", { fg = "#f9e2af" })
  -- h(0, "Type", { fg = "#b5bfe2" })
  -- h(0, "Number", { fg = "#fab387" })
  -- h(0, "Float", { fg = "#fab387" })
  -- h(0, "Boolean", { link = "Special" })
  -- h(0, "Identifier", { fg = "#cdd6f4" })
  -- h(0, "Special", { fg = "#94e2d5" })
  -- h(0, "SpecialChar", { fg = "#eba0ac" })
  -- h(0, "Operator", { link = "SpecialChar" })
end

function Theme:create_statusbar()
  vim.opt.statusline:append(" ")
  vim.opt.statusline:append("%f ")
  vim.opt.statusline:append("%m ")
  vim.opt.statusline:append("%r ")
  vim.opt.statusline:append("%= ")
  vim.opt.statusline:append("%-13.(%l,%c%V%) %P")
  vim.opt.statusline:append(" ")
end

function Theme:setup(colorscheme)
  vim.cmd.colorscheme(colorscheme)
  self:create_highlight_groups()
  self:create_statusbar()
end

return Theme
