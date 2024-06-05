vim.g.netrw_banner = 0
vim.g.mapleader = " "
-- vim.opt.guicursor = ""

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wildmenu = true
vim.opt.wildoptions = "fuzzy,tagfile"
vim.opt.path:append("**")
vim.opt.wildignore:append("./git/*")
vim.opt.wildignore:append("./node_modules/*")
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
vim.opt.splitbelow = true

-- spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = false


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
vim.opt.statusline = " %{v:lua.UD_status_line_current_mode()}   %f %m %r %= %S       %{v:lua.UD_recording_macro()}    %-14.(%l,%c%V%) %P "

-- vim.optdatetime = 10
