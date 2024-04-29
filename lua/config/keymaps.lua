local Util = require("moozd.util")
local Apps = require("moozd.apps")
local dap, dapui = require("dap"), require("dapui")

local map = Util.empty_map_table()

if vim.g.neovide then
  require("config.utils.neovide").setupKeybindings()
end

if vim.g.vscode then
  local vscode = require("vscode-neovim")
  local function action(command, args)
    return function()
      vscode.action(command, { args = args })
    end
  end

  map.n["gd"] = { action("editor.action.revealDefinition"), desc = "Go to definitions" }
  map.n["gK"] = { action("editor.action.showHover"), desc = "Show signature help" }
  map.n["gi"] = { action("editor.action.goToImplementation") }
  map.n["gr"] = { action("editor.action.goToReferences") }
  map.n["gcc"] = { action("editor.action.addCommentLine") }

  map.n["<leader>e"] = { action("workbench.view.explorer") }
  map.n["<Leader>;"] = { action("workbench.action.navigateBackInNavigationLocations") }
  map.n["<Leader>w"] = { action("workbench.action.files.save") }
  map.n["<Leader>W"] = { action("workbench.action.files.saveFiles") }
  map.n["<leader>X"] = { action("workbench.action.closeOtherEditors") }
  map.n["<leader>x"] = { action("workbench.action.closeActiveEditor") }
  map.n["<leader>]"] = { action("workbench.action.nextEditor") }
  map.n["<leader>["] = { action("workbench.action.previousEditor") }

  map.n["<leader>cf"] = { action("editor.action.formatDocument") }
  map.n["<leader>cc"] = { action("editor.action.quickFix") }
  map.n["<leader>cr"] = { action("editor.action.rename") }

  map.n["<leader>ag"] = { action("workbench.view.scm") }
  map.n["<leader>at"] = { action("workbench.action.terminal.toggleTerminal") }

  map.n["<leader>fs"] = { action("workbench.action.findInFiles") }
  map.n["<leader>fw"] = { action("workbench.action.findInFiles") }
  map.n["<leader>fS"] = { action("workbench.action.replaceInFiles") }
  map.n["<leader>ff"] = { action("workbench.action.quickOpen") }
else
  --- navigation ---------------------
  map.n["gb"] = {
    "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",
    desc = "buffers",
  }

  map.n["gt"] = {
    "<cmd>Telescope telescope-tabs list_tabs  theme=dropdown previewer=false<cr>",
    desc = Util.get_icon("DefaultFile", 1) .. "Tabs",
  }

  map.n["]t"] = { "<cmd>tabn<cr>", desc = "tab" }
  map.n["]b"] = { "<cmd>bnext<cr>", desc = "buffer" }
  map.n["]d"] = { vim.diagnostic.goto_next, desc = "problem" }
  map.n["]c"] = { "<cmd>silent! Gitsigns next_hunk<cr>", desc = "change" }
  map.n["]j"] = { "<c-i>", desc = "jump" }

  map.n["[t"] = { "<cmd>tabp<cr>", desc = "tab" }
  map.n["[b"] = { "<cmd>bprev<cr>", desc = "buffer" }
  map.n["[d"] = { vim.diagnostic.goto_prev, desc = "problem" }
  map.n["[c"] = { "<cmd>silent! Gitsigns prev_hunk<cr>", desc = "change" }
  map.n["[j"] = { "<c-o>", desc = "jump" }

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

  map.n["X"] = { "<cmd>noh!<cr>", desc = "Cancel search" }

  -- map.n["<leader><Left>"] = { "<C-w>h", desc = Util.get_icon("ArrowLeft", 1) .. "Left" }
  -- map.n["<leader><Down>"] = { "<C-w>j", desc = Util.get_icon("ArrowDown", 1) .. "Down" }
  -- map.n["<leader><Up>"] = { "<C-w>k", desc = Util.get_icon("ArrowUp", 1) .. "Up" }
  -- map.n["<leader><Right>"] = { "<C-w>l", desc = Util.get_icon("ArrowRight", 1) .. "Right" }
  map.n["<PageUp>"] = { "<cmd>resize +1<CR>", desc = "Resize split up" }
  map.n["<PageDown>"] = { "<cmd>resize -1<CR>", desc = "Resize split down" }
  map.n["<C-PageDown>"] = { "<cmd>vertical resize +1<CR>", desc = "Resize split left" }
  map.n["<C-PageUp>"] = { "<cmd>vertical resize -1<CR>", desc = "Resize split right" }
  --
  map.n["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }
  map.i["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }

  map.n["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }
  map.i["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }
  map.n["<c-ESC>"] = { "<c-\\><c-n>" }

  --- overall-------------------------
  -- stylua: ignore


  map.n["<leader>x"] = { "<cmd>silent! bdelete<cr>", desc = Util.get_icon("TabClose", 1) .. "Close" }
  -- map.n["<leader>X"] = { Util.close_all_but_this, desc = Util.get_icon("BufferClose", 1) .. "Close All" }
  map.n["<leader>w"] = { "<cmd>silent! w<cr>", desc = Util.get_icon("DefaultFile", 1) .. "Save" }
  -- map.n["<leader>W"] = { "<cmd>silent! wa<cr>", desc = Util.get_icon("Session", 1) .. "Save All" }
  -- map.n["<leader>;"] = { "<cmd>buf #<cr>", desc = Util.get_icon("Bookmarks", 1) .. "Switch" }
  -- map.n["<leader>T"] = { "<cmd>silent! TagbarToggle<cr>", desc = Util.get_icon("Tab", 1) .. "Tags" }
  map.n["<leader>R"] = { "<cmd>ConfigReload<cr>", desc = "Reload nvim configuration" }

  --- terminal -----------------------
  map.n["gT"] = { "<cmd>ToggleTerm direction=vertical size=100<cr>", desc = Util.get_icon("Terminal", 1) .. "Terminal" }

  --- menu--------------------------
  local sections = {
    e = { desc = Util.get_icon("FolderOpen", 1) .. "Explorer" },
    f = { desc = Util.get_icon("Search", 1) .. "Find" },
    c = { desc = Util.get_icon("DefaultFile", 1) .. "Code" },
    a = { desc = Util.get_icon("Terminal", 1) .. "Apps" },
    g = { desc = Util.get_icon("Git", 1) .. "Git" },
    d = { desc = Util.get_icon("Debugger", 1) .. "Debugger" },
    D = { desc = Util.get_icon("Diagnostic", 1) .. "Diagnostics" },
    l = { desc = Util.get_icon("GitUntracked", 1) .. "LeetCode" },
    o = { desc = Util.get_icon("Package", 1) .. "Overseer" },
    S = { desc = Util.get_icon("Session", 1) .. "Session" },
    s = { desc = " " .. "Database" },
  }

  map.n["<leader>s"] = sections.s
  map.n["<leader>ss"] = { "<cmd>DBUIToggle<cr>", desc = "UI" }
  map.n["<leader>sa"] = { "<cmd>DBUIFindBuffer<cr>", desc = "Attach" }
  map.n["<leader>sc"] = { "<cmd>DBUIAddConnection<cr>", desc = "Connections" }

  map.n["<leader>o"] = sections.o
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
  map.n["<leader>d"] = sections.d
  map.n["<leader>db"] = { dap.toggle_breakpoint, desc = "Breakpoint" }
  map.n["<leader>dc"] = { dap.continue, desc = "start/continue" }
  map.n["<leader>do"] = { dap.step_over, desc = "step over" }
  map.n["<leader>di"] = { dap.step_into, desc = "step into" }
  map.n["<leader>du"] = { dap.step_out, desc = "step out" }
  map.n["<leader>dx"] = { dap.terminate, desc = "Terminate" }
  map.n["<leader>dd"] = { dapui.toggle, desc = "Debugger" }
  map.n["<leader>df"] = { dapui.float_element, desc = "Float" }
  map.v["<leader>de"] = { dapui.eval, desc = "Eval" }

  --- Sessions --------------------------
  local resession = require("resession")

  map.n["<leader>S"] = sections.S
  map.n["<leader>Ss"] = { resession.save, desc = "Save session." }
  map.n["<leader>Sl"] = { resession.load, desc = "Last session." }
  map.n["<leader>Sd"] = { resession.delete, desc = "Delete session." }

  --- Explorer ---------------------------
  map.n["<leader>e"] = { "<cmd>Neotree focus toggle <cr>", desc = Util.get_icon("Explorer", 1) .. "Explorer" }

  --- Git --------------------------------
  map.n["<leader>g"] = sections.g
  map.n["<leader>gd"] = { "<cmd>Gdiffsplit<cr>", desc = "Diff" }
  map.n["<leader>gc"] = { "<cmd>BCommits<cr>", desc = "Commits" }
  map.n["<leader>gb"] = { "<cmd>Git blame<cr>", desc = "Blame" }
  map.n["<leader>gl"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame line" }
  map.n["<leader>gh"] = { "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk" }

  --- Apps -------------------------------
  map.n["<leader>a"] = sections.a
  map.n["<leader>ag"] = { Apps.lazygit, desc = Util.get_icon("Git", 1) .. "Git" }
  map.n["<leader>ae"] = { Apps.ranger, desc = Util.get_icon("FolderOpen", 1) .. "Explorer" }
  map.n["<leader>at"] = { Apps.terminal, desc = Util.get_icon("Terminal", 1) .. "Terminal" }
  map.n["<leader>ad"] = { Apps.lazydocker, desc = Util.get_icon("Docker", 1) .. "Docker" }
  map.n["<leader>as"] = { Apps.btm, desc = Util.get_icon("Stats", 1) .. "Stats" }
  map.n["<leader>ar"] = { Apps.glow, desc = "  " .. "Readme" }
  map.n["<leader>ab"] = { "<cmd>ToggleTerm<cr>", desc = "  Bottom Terminal" }
  --

  --- Diagnostic --------------------------

  map.n["<leader>D"] = sections.D
  -- stylua: ignore
  map.n["<leader>Ds"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Diagnostics" }

  --- find --------------------------
  map.n["<leader>f"] = sections.f
  map.n["<leader>fs"] = { "<cmd>Ag<cr>", desc = "Search" }
  map.n["<leader>fS"] = { "<cmd>Spectre <cr>", desc = "Replace" }
  map.n["<leader>ff"] = { "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", desc = "Find (Telescope)" }
  map.n["<leader>fo"] = { "<cmd>Telescope oldfiles <cr>", desc = "Recent files (Telescope)" }
  map.n["<leader>fm"] = { "<cmd>Telescope marks <cr>", desc = "Marks(Telescope)" }
  map.n["<leader>fz"] = { "<cmd>Files<cr>", desc = "Find (FZF)" }
  map.n["<leader>fw"] = { "<cmd>Telescope live_grep <cr>", desc = "Find words" }
  map.n["<leader>ft"] = { "<cmd>TodoTelescope<cr>", desc = "TODOS" }
  map.n["<leader>fd"] = { "<cmd>Telescope lsp_document_symbols <cr>", desc = "Find symbols" }
  map.n["<leader>fD"] = { "<cmd>Telescope lsp_workspace_symbols <cr>", desc = "Find project symbols" }

  --- code --------------------------
  map.n["<leader>c"] = sections.c
  map.n["<leader>cf"] = { vim.lsp.buf.format, desc = "Format" }
  map.n["<leader>cr"] = { vim.lsp.buf.rename, desc = "Rename" }
  map.n["<leader>cc"] = { vim.lsp.buf.code_action, desc = "Code actions" }
  map.n["<leader>ct"] = { "<cmd>TestSuite<cr>", desc = "Run tests" }

  --- LeetCode ----------------------
  if vim.fn.argc(-1) == 0 then
    map.n["<leader>l"] = sections.l
    map.n["<leader>ld"] = { "<cmd>Leet<cr>", desc = "Dashboard" }
    map.n["<leader>lr"] = { "<cmd>Leet run<cr>", desc = "Run" }
    map.n["<leader>ls"] = { "<cmd>Leet submit<cr>", desc = "Submit" }
    map.n["<leader>ll"] = { "<cmd>Leet list<cr>", desc = "Find" }
    map.n["<leader>lL"] = { "<cmd>Language<cr>", desc = "Language" }

  end
end

Util.setup_keymap(map)
