return {

  {
    "stevearc/overseer.nvim",
    opts = {},
    config = function()
      require("overseer").setup()
    end,
  },

  {
    "stevearc/resession.nvim",
    opts = {
      extensions = {
        quickfix = {},
        overseer = {},
      },
    },
    config=function ()
      require("overseer").setup({
  dap = false,
})
    end
  },
}
