local M = {}

function M.cd(path)
  vim.api.nvim_command("%bd")
  vim.api.nvim_command("cd " .. path)
end

function M.create_command()
  vim.api.nvim_create_user_command("Go", function(a)
    vim.api.nvim_command("silent! %bd|silent! cd" .. " " .. a["args"])
  end, { nargs = 1, complete="dir", desc = "Go to directory" })
end

return M
