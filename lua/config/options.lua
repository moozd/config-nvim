if vim.g.neovide then
  vim.g.neovide_fullscreen = 1
  vim.opt.lsp = 6
  vim.g.neovide_underline_stroke_scale = 2
  vim.g.neovide_padding_top = 2
  -- vim.g.neovide_padding_bottom = 5
  -- vim.g.neovide_padding_right = 8
  -- vim.g.neovide_padding_left = 8

  vim.g.terminal_color_0 = "#45475a"
  vim.g.terminal_color_1 = "#f38ba8"
  vim.g.terminal_color_2 = "#a6e3a1"
  vim.g.terminal_color_3 = "#f9e2af"
  vim.g.terminal_color_4 = "#89b4fa"
  vim.g.terminal_color_5 = "#f5c2e7"
  vim.g.terminal_color_6 = "#94e2d5"
  vim.g.terminal_color_7 = "#bac2de"
  vim.g.terminal_color_8 = "#585b70"
  vim.g.terminal_color_9 = "#f38ba8"
  vim.g.terminal_color_10 = "#a6e3a1"
  vim.g.terminal_color_11 = "#f9e2af"
  vim.g.terminal_color_12 = "#89b4fa"
  vim.g.terminal_color_13 = "#f5c2e7"
  vim.g.terminal_color_14 = "#94e2d5"
  vim.g.terminal_color_15 = "#a6adc8"
end
-- vim.g.netrw_banner = 0
vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wildmenu = true
vim.opt.wildoptions = "fuzzy,tagfile"
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.pumheight = 10
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
