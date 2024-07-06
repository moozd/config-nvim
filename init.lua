require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")

vim.cmd.colorscheme("catppuccin")
require("config.theme"):new():setup({ hl = { transparent = false } })
