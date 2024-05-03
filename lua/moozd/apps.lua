local app = require("moozd.util").create_terminal_app

-- gearo are one
return {
  terminal = app({}),
  ranger = app({cmd="ranger"}),
  lazygit = app({ cmd = "lazygit" }),
  lazydocker = app({ cmd = "lazydocker", dir = "~/" }),
  btm = app({ cmd = "btm -b" }),
  spotify = app({ cmd = "spt" }),
  glow = app({cmd="glow"})
}

