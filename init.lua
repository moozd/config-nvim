require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")

vim.cmd.colorscheme("poimandres")
require("config.theme"):new():setup({ hl = { transparent = false } })
