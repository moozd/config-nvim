return function()
  local selectioncount = require("lualine.components.selectioncount")
  local count = selectioncount()

  if string.len(count) == 0 then
    return ""
  end
  return "󰔌 " .. count
end
