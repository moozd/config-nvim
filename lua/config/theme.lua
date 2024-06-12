require("catppuccin").setup({
  styles = {
    comments = {},
    conditionals = { "italic" },
    loops = { "italic" },
    functions = {},
    keywords = { "italic" },
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  highlight_overrides = {},
})
vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "StatusLine", { fg ="#b4befe", bg = "#181825" , bold=true})
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#9399b2", bg = "#1e1e2e"})

vim.cmd("highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineOk cterm=undercurl gui=undercurl")


vim.opt.statusline:append(" ")
vim.opt.statusline:append("%f ")
vim.opt.statusline:append("%m ")
vim.opt.statusline:append("%r ")
vim.opt.statusline:append("%= ")
vim.opt.statusline:append("%-13.(%l,%c%V%) %P")
vim.opt.statusline:append(" ")
