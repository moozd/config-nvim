return {
  "klen/nvim-test",
  config = function()
        require("nvim-test").setup({
      term = "toggleterm",
    })
    require("nvim-test.runners.jest"):setup({
      args={"--watch", "--verbose"}
    })

  end,
}
