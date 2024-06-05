vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "StatusLine", { fg = "#1e212e" ,bg="#585b70", bold=false})
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none",fg="#6c7086", italic = false })

vim.cmd("highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineOk cterm=undercurl gui=undercurl")

vim.cmd("highlight IlluminatedWordRead cterm=NONE gui=NONE  guibg=#393b4e")
vim.cmd("highlight IlluminatedWordText cterm=NONE gui=NONE  guibg=#393b4e")
vim.cmd("highlight IlluminatedWordWrite cterm=NONE gui=NONE guibg=#393b4e")

