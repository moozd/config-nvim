local Util = require("moozd.util")
local dap, dapui = require("dap"), require("dapui")
local harpoon = require("harpoon")

local map = Util.empty_map_table()

--- navigation ---------------------

vim.keymap.set("n", "]t", "<cmd>tabn<cr>")
vim.keymap.set("n", "]b", "<cmd>bnext<cr>")

map.n["]d"] = { vim.diagnostic.goto_next, desc = "problem" }
map.n["]c"] = { "<cmd>silent! Gitsigns next_hunk<cr>", desc = "change" }
map.n["]j"] = { "<c-i>", desc = "jump" }
map.n["]h"] = {
  function()
    harpoon:list():next()
  end,
}

map.n["[t"] = { "<cmd>tabp<cr>", desc = "tab" }
map.n["[b"] = { "<cmd>bprev<cr>", desc = "buffer" }
map.n["[d"] = { vim.diagnostic.goto_prev, desc = "problem" }
map.n["[c"] = { "<cmd>silent! Gitsigns prev_hunk<cr>", desc = "change" }
map.n["[j"] = { "<c-o>", desc = "jump" }

map.n["[h"] = {
  function()
    harpoon:list():prev()
  end,
}
---lp
map.n["gd"] = { vim.lsp.buf.definition, desc = "Go to definitions" }
map.n["gs"] = { vim.lsp.buf.document_symbol, desc = "Go to document symbols" }
map.n["gS"] = { vim.lsp.buf.workspace_symbol, desc = "Go to workspace symbol" }
map.n["gr"] = { vim.lsp.buf.references, desc = "List references" }
map.n["gi"] = { vim.lsp.buf.implementation, desc = "List implementations" }
map.n["gk"] = { vim.lsp.buf.hover, desc = "Show hover help" }
map.n["gK"] = { vim.lsp.buf.signature_help, desc = "Show signature help" }

map.n["<c-F5>"] = { dap.continue, desc = "start/continue" }
map.n["<c-F10>"] = { dap.step_over, desc = "step over" }
map.n["<c-F11>"] = { dap.step_into, desc = "step into" }
map.n["<c-F12>"] = { dap.step_out, desc = "step out" }
map.n["gj"] = { dap.toggle_breakpoint, desc = "Breakpoint" }

map.n["<ESC>"] = { "<cmd>silent! noh<cr>" }




-- stylua: ignore
map.n["gh"] = { function() vim.diagnostic.config({ virtual_text = true }) end, }
-- stylua: ignore
map.n["ghh"] = { function() vim.diagnostic.config({ virtual_text = false }) end, }

-- map.n["<Up>"] = { "<cmd>resize +1<CR>", desc = "Resize split up" }
-- map.n["<Down>"] = { "<cmd>resize -1<CR>", desc = "Resize split down" }
-- map.n["<Left>"] = { "<cmd>vertical resize +1<CR>", desc = "Resize split left" }
-- map.n["<Right>"] = { "<cmd>vertical resize -1<CR>", desc = "Resize split right" }
--
map.n["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }
map.i["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }

map.n["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }
map.i["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }

--- Run -----------------------
map.n["<leader>o"] = { desc = "Tasks" }
map.n["<leader>oo"] = { "<cmd>OverseerToggle right<cr>", desc = "Toggle" }
map.n["<leader>oi"] = { "<cmd>OverseerInfo<cr>", desc = "Info" }
map.n["<leader>ob"] = { "<cmd>OverseerBuild<cr>", desc = "Build" }
map.n["<leader>or"] = { "<cmd>OverseerRun<cr>", desc = "Run" }
map.n["<leader>oc"] = { "<cmd>OverseerRunCmd<cr>", desc = "Cmd" }
map.n["<leader>oa"] = { "<cmd>OverseerTaskAction<cr>", desc = "Action" }
map.n["<leader>ob"] = { desc = "Bundle" }
map.n["<leader>obl"] = { "<cmd>OverseerLoadBundle<cr>", desc = "Load" }
map.n["<leader>obd"] = { "<cmd>OverseerDeleteBundle<cr>", desc = "Delete" }

map.n["<leader>obs"] = { "<cmd>OverseerSaveBundle<cr>", desc = "Save" }
--- DAP ------------------------------
map.n["<leader>D"] = { desc = "Debug" }
map.n["<leader>Db"] = { dap.toggle_breakpoint, desc = "Breakpoint" }
map.n["<leader>Dc"] = { dap.continue, desc = "start/continue" }
map.n["<leader>Do"] = { dap.step_over, desc = "step over" }
map.n["<leader>Di"] = { dap.step_into, desc = "step into" }
map.n["<leader>Du"] = { dap.step_out, desc = "step out" }
map.n["<leader>Dx"] = { dap.terminate, desc = "Terminate" }
map.n["<leader>Dd"] = { dapui.toggle, desc = "Debugger" }
map.n["<leader>Df"] = { dapui.float_element, desc = "Float" }
map.v["<leader>De"] = { dapui.eval, desc = "Eval" }

--- Git --------------------------------
map.n["<leader>g"] = { desc = "Git" }
map.n["<leader>gd"] = { "<cmd>Gdiffsplit<cr>", desc = "Diff" }
map.n["<leader>gc"] = { "<cmd>BCommits<cr>", desc = "Commits" }
map.n["<leader>gb"] = { "<cmd>Git blame<cr>", desc = "Blame" }
map.n["<leader>gl"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame line" }
map.n["<leader>gh"] = { "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk" }

--- core  -------------------------
map.n["<leader>c"] = { vim.lsp.buf.code_action, desc = "Code actions" }
map.n["<leader>f"] = { vim.lsp.buf.format, desc = "Format" }
map.n["<leader>r"] = { vim.lsp.buf.rename, desc = "Rename" }
map.n["<leader>t"] = { "<cmd>Trouble<cr>", desc = "Troubles" }
map.n["<leader>u"] = { "<cmd>UndotreeToggle<cr>", desc = "History" }
map.n["<leader>,"] = { "<cmd>Neotree position=current<cr>", desc = "Explore" }
map.n["<leader>s"] = { "<cmd>Telescope live_grep<cr>", desc = "Find words" }
map.n["<leader>E"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" }
map.n["<leader>e"] = {
  function()
    local t = require("telescope.builtin")
    local ok = pcall(t.git_files)
    if not ok then
      t.find_files()
    end
  end,
  desc = "Find files",
}

Util.setup_keymap(map)
