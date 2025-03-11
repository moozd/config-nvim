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
-- git
map("n", "git", "<cmd>vertical G<cr>")
map("n", "<leader>gh", "<cmd>Gllog %<cr>")
map("n", "<leader>gd", "<cmd>Gvdiffsplit<cr>")
map("n", "<leader>gb", "<cmd>G blame<cr>")

-- exit normal mode
map("i", "jj", "<esc>")
map("i", "jk", "<esc>")
map({ "i", "n", "v" }, "<c-[>", "<esc>")

map({ "n" }, "term", "<cmd>ToggleTerm direction=float name=Console<cr>")
map({ "n", "i", "t" }, "<c-x>", "<cmd>silent! close<cr>")

map({ "n", "i" }, "<M-UP>", "<cmd>m-2<cr>")
map({ "n", "i" }, "<M-Down>", "<cmd>m+1<cr>")
map({ "n", "i" }, "<M-k>", "<cmd>m-2<cr>")
map({ "n", "i" }, "<M-j>", "<cmd>m+1<cr>")

map("n", "<S-Up>", ":resize -2<CR>")
map("n", "<S-Down>", ":resize +2<CR>")
map("n", "<S-Left>", ":vertical resize -2<CR>")
map("n", "<S-Right>", ":vertical resize +2<CR>")

map("n", "<leader>or", "<cmd>OverseerRun<cr>")
map("n", "<leader>oa", "<cmd>OverseerTaskAction<cr>")
map("n", "<leader>ob", "<cmd>OverseerLoadBundle<cr>")

map("n", "<leader>d", "<cmd>Trouble diagnostics focus<cr>")

map("n", "<leader>s", "<cmd>Telescope live_grep previewer=false<cr>")
map("n", "<leader>e", function()
  require("telescope.builtin").find_files({
    previewer = false,
    show_untracked = true,
    hidden = true,
    git_status = true,
    git_icons = { changed = "M", staged = "S", untracked = "U" },
    file_ignore_patterns = { ".git", "node_modules" },
  })
end)
map("n", "<leader>q", "<cmd>Oil<cr>")
map("n", "<leader>c", vim.lsp.buf.code_action)
map("n", "<leader>f", require("conform").format)
map("n", "<leader>r", vim.lsp.buf.rename)

map("n", "<leader>S", function()
  require("null-ls").toggle("cspell")
end)

local harpoon = require("harpoon")
map("n", "[h", function()
  harpoon:list():prev()
end)

map("n", "]h", function()
  harpoon:list():next()
end)
map("n", "<c-l>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
map("n", "<C-k>", function()
  harpoon:list():add()
end)
