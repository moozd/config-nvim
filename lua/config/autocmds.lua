local augroup = require("moozd.util").augroup
local autocmd = vim.api.nvim_create_autocmd
-- autocmd("CmdlineEnter", {
--   desc = "Open command line",
--   group = augroup("open_command_line"),
--   callback = function()
--     vim.o.cmdheight = 2
--   end,
-- })
--
-- autocmd("CmdlineLeave", {
--   desc = "Close command line",
--   group = augroup("close_command_line"),
--   callback = function()
--     vim.cmd('echo ""')
--     vim.o.cmdheight = 0
--   end,
-- })

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- -- go to last loc when opening a buffer
autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd("TermOpen", {
  pattern = "*",
  group = augroup("disable_term_line_no"),
  command = "setlocal nonumber norelativenumber",
})

