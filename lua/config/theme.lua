vim.g.zenbones_italc_comments = false
vim.g.zenbones_darkness = 'stark'
vim.cmd.colorscheme("rose-pine")
vim.cmd([[set background=dark]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

vim.cmd("highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineOk cterm=undercurl gui=undercurl")

vim.cmd("highlight IlluminatedWordRead cterm=NONE gui=NONE  guibg=#393b4e")
vim.cmd("highlight IlluminatedWordText cterm=NONE gui=NONE  guibg=#393b4e")
vim.cmd("highlight IlluminatedWordWrite cterm=NONE gui=NONE guibg=#393b4e")

vim.fn.sign_define("DiagnosticSignError", { text = "•", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "•", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "•", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "•", texthl = "DiagnosticSignHint" })
