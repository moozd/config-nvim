vim.g.gui_font_default_size = 16.25
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face ="SauceCodePro Nerd Font Propo"

local function refresh()
  vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

local function resize(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  refresh()
end

local function reset()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  refresh()
end

local M = {}

function M.setupKeybindings()
  vim.g.neovide_input_use_logo = 1
  vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

  -- zoom
  reset()
  local opts = { noremap = true, silent = true }
  vim.keymap.set({ "n", "i" }, "<C-=>", function()
    resize(0.25)
  end, opts)

  vim.keymap.set({ "n", "i" }, "<C-->", function()
    resize(-0.25)
  end, opts)

  vim.keymap.set({ "n", "i" }, "<C-0>", function()
    reset()
  end, opts)
end

return M
