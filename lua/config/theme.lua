Theme = {}

function Theme:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Theme:create_highlight_groups(opts)
  local h = vim.api.nvim_set_hl
  -- Diagnostic
  if vim.g.neovide then
    h(0, "DiagnosticUnderlineOk", { undercurl = true })
    h(0, "DiagnosticUnderlineInfo", { undercurl = true })
    h(0, "DiagnosticUnderlineWarn", { undercurl = true })
    h(0, "DiagnosticUnderlineHint", { undercurl = true })
    h(0, "DiagnosticUnderlineError", { undercurl = true })
  end
  vim.diagnostic.config({
    signs = {
      severity_limit = "WARN",
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
    },
  })
  -- interface
  if opts["transparent"] then
    h(0, "Normal", { bg = "None" })
    h(0, "NormalNC", { link = "Normal" })
    h(0, "LineNr", { link = "Normal" })
    h(0, "SignColumn", { link = "Normal" })
  end
  -- h(0, "MatchParen", { bold = true, fg="#b4be00" })
  -- h(0, "StatusLine", { bg = "#181825",fg="#b4befe", bold = false })
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

function Theme:setup(opts)
  self:create_highlight_groups(opts["hl"])
  self:create_statusbar()
end

return Theme
