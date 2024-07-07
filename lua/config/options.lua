vim.g.netrw_banner = 0
vim.g.mapleader = " "
vim.opt.guicursor = ""

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wildmenu = true
vim.opt.wildoptions = "fuzzy,tagfile"
-- vim.opt.path:append("**")
-- vim.opt.wildignore:append("./git/*")
-- vim.opt.wildignore:append("./node_modules/*")
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

-- spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = false
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
