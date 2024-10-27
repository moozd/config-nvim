local map = vim.keymap.set

map("n", "]j", "<c-i>")
map("n", "[j", "<c-o>")
map("n", "]t", "<cmd>tabn<cr>")
map("n", "[t", "<cmd>tabp<cr>")
map("n", "]b", "<cmd>bnext<cr>")
map("n", "[b", "<cmd>bprev<cr>")
map("n", "]d", vim.diagnostic.goto_next)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]c", "g,")
map("n", "[c", "g;")

map("n", "gk", vim.lsp.buf.hover)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gr", vim.lsp.buf.references)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gs", vim.lsp.buf.document_symbol)
map("n", "gS", vim.lsp.buf.workspace_symbol)
map("n", "git", "<cmd>vertical G<cr>")
map("n", "<leader>gh", "<cmd>Gllog %<cr>")
map("n", "<leader>gd", "<cmd>Gdiffsplit<cr>")
map("n", "<leader>gb", "<cmd>G blame<cr>")
map("i", "jj", "<esc>")

map({ "n" }, "term", "<cmd>ToggleTerm direction=float name=Console<cr>")
map({ "n", "i", "t" }, "<c-x>", "<cmd>silent! close<cr>")

map({ "n", "i" }, "<M-UP>", "<cmd>m-2<cr>")
map({ "n", "i" }, "<M-Down>", "<cmd>m+1<cr>")

map("n", "<Up>", ":resize -2<CR>")
map("n", "<Down>", ":resize +2<CR>")
map("n", "<Left>", ":vertical resize -2<CR>")
map("n", "<Right>", ":vertical resize +2<CR>")

map("n", "<leader>or", "<cmd>OverseerRun<cr>")
map("n", "<leader>oa", "<cmd>OverseerTaskAction<cr>")
map("n", "<leader>ob", "<cmd>OverseerLoadBundle<cr>")

map("n", "<leader>q", "<cmd>Neotree toggle position=left<cr>")
map("n", "<leader>Q", "<cmd>Oil<cr>")
map("n", "<leader>d", "<cmd>Trouble diagnostics toggle focus=true follow=true<cr>")
map("n", "<leader>l", "<cmd>Trouble symbols toggle focus=true follow=true<cr>")

map("n", "<leader>s", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>S", "<cmd>Spectre<cr>")
map("n", "<leader>p", "<cmd>Telescope<cr>")
map("n", "<leader>e", "<cmd>Telescope find_files<cr>")
map("n", "<leader>c", vim.lsp.buf.code_action)
map("n", "<leader>f", require("conform").format)
map("n", "<leader>r", vim.lsp.buf.rename)

if vim.g.neovide then
  map("n", "<c-a><c-a>", function()
    local Terminal = require("toggleterm.terminal").Terminal
    Terminal:new({ cmd = "source ~/.config/neovide/hub/hub.sh && neovide_hub_open", direction = "float" }):toggle()
  end)
end
