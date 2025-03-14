vim.g.netrw_banner = 0
vim.g.netrw_hide = 1
vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.nu = true
vim.opt.relativenumber = true

-- tab settings
vim.opt.expandtab = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.shiftround = true
vim.opt.softtabstop = 4


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
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
