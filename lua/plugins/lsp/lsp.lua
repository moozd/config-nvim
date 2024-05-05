local M = {}

 function M.configure()
  require("neoconf").setup({})
  require("mason").setup({})
  require("mason-lspconfig").setup({})
  require("mason-lspconfig").setup_handlers({
    function(server_name)
      if server_name == "volar" then
        require("lspconfig").volar.setup({
          filetypes = { "vue" },
          init_options = {
            vue = {
              hybridMode = false,
            },
            typescript = {
              tsdk = vim.fn.getcwd() .. "node_modules/typescript/lib",
            },
          },
        })
      elseif require("lspconfig")[server_name] then
        require("lspconfig")[server_name].setup({})
      end
    end,
  })

  require("null-ls").setup({})
  require("mason-null-ls").setup({
    handlers = {
      function(source_name, methods)
        require("mason-null-ls").default_setup(source_name, methods)
      end,
    },
  })

  require("rust-tools").setup({})
end

return M
