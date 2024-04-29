local function get_mode()
  local mode = require("lualine.components.mode")()
  local sm = string.sub(mode, 0, 1)
  if mode == "V-LINE" then
    sm = "VL"
  end

  if mode == "V-BLOCK" then
    sm = "VB"
  end

  local icons = {
    N = "󰅶",
    V = "",
    VL = "󰦩",
    VB = "󰹞",
    C = "󰘳",
    T = "󰘔",
    I = "󰙏",
  }

  local abbr = {
    N = "NOR",
    I = "INS",
    V = "VIS",
    VL = "VIS",
    VB = "VIS",
    C = "CMD",
    T = "TERM",
  }

  return { icon = (icons[sm] or sm), abbr = abbr[sm], text = mode }
end

local M = {}

function M.raw()
    return get_mode().text
end

function M.icon_and_abbr()
  local m = get_mode()
  return m.icon .. " " .. m.abbr
end

function M.icon_and_text()
  local m = get_mode()
  return m.icon .. "  " .. m.text:lower():gsub("^%l", string.upper)
end

function M.icon()
  return get_mode().icon .. " "
end

function M.text()
  return get_mode().text
end

function M.vim_style()
  return "--" .. get_mode().text .. "--"
end

function M.abbr()
  return get_mode().abbr
end

function M.special()
  return require("moozd.status.project")() .. " " .. M.icon_and_abbr()
end

return M
