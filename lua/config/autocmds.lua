local augroup = require("moozd.util").augroup
local autocmd = vim.api.nvim_create_autocmd
-- autocmd("BufWritePost", {
--   desc = "Auto format after save",
--   group = augroup("format_after_save"),
--   callback = function()
--     vim.cmd("silent! lua vim.lsp.buf.format()")
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

-- autocmd("ModeChanged", {
--   group = augroup("fix_statusline"),
--   callback = function()
--     vim.schedule(vim.cmd.redraw)
--   end,
-- })

-- local cmd_height_adj_grp = vim.api.nvim_create_augroup("cmd_line_adjust", { clear = true })
-- autocmd("CmdlineEnter", {
--   group = cmd_height_adj_grp,
--   callback = function()
--     vim.o.cmdheight = 1
--   end,
-- })
--
-- autocmd("CmdlineLeave", {
--   group = cmd_height_adj_grp,
--   callback = function()
--     vim.defer_fn(function()
--       vim.o.cmdheight = 0
--     end, 2000)
--   end,
-- })
