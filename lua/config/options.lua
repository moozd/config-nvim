if vim.g.neovide then
  vim.g.neovide_fullscreen = 1
  vim.g.neovide_cursor_animation_length = 0
  vim.opt.lsp = 2
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5
end
vim.g.netrw_banner = 0
vim.g.mapleader = " "
vim.opt.guicursor = ""

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
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

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
