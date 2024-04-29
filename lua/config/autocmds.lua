local augroup = require("moozd.util").augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  desc = "Start up",
  group = augroup("start_up_setings"),
  callback = function() end,
})

autocmd("BufWritePost", {
  desc = "Auto format after save",
  group = augroup("format_after_save"),
  callback = function()
    vim.cmd("silent! lua vim.lsp.buf.format()")
  end,
})

autocmd("CmdlineEnter", {
  desc = "Open command line",
  group = augroup("open_command_line"),
  callback = function()
    vim.o.cmdheight = 1
  end,
})

autocmd("CmdlineLeave", {
  desc = "Close command line",
  group = augroup("close_command_line"),
  callback = function()
    vim.cmd('echo ""')
    vim.o.cmdheight = 0
  end,
})

-- close some filetypes with <q>
autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "toggleterm",
    "telescope",
    "terminal",
    "fzf",
    "dbout",
    "fugitiveblame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
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



--TODO: WIP
-- autocmdg"FileType", {
--   pattern = "sql",
--   group = augroup("sql_keybindings"),
--   callback = function()
--     vim.api.nvim_set_keymap("n", "dba", "", {})
--   end,
-- })
