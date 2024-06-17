return {

  "rose-pine/nvim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      styles = {
        italic = false,
        transparency = true,
      },
    })
  end,
}
