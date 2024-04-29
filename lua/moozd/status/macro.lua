return function()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "󰑋 "  ..recording_register
  end
end
