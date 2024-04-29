local util = require("moozd.util")

local commands = {}

commands["ChangeDirectory"] = {
  is_experimental = true,
  opts = { nargs = 1, complete = "dir", desc = "Change root directory" },
  fn = function(a)
    vim.cmd("bufdo bwipeout |silent! cd" .. " " .. a["args"])
  end,
}

commands["GoHome"] = {
  is_experimental = true,
  opts = { nargs = 0, desc = "Home" },
  cmd = "ChangeDirectory " .. vim.env.HOME,
}

commands["ConfigReload"] = {
  opts = { desc = "Hot reload nvim configuration" },
  fn = require("moozd.config_reload").reload,
}

util.setup_commands(commands)
