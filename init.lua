require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")

vim.cmd.colorscheme("tokyonight-storm")
require("config.theme"):new():setup({ hl = { transparent = false } })
