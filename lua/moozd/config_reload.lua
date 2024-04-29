local M = {}

function M.reload()
  local cache = (_G.__luacache or {}).cache
  for pkg, _ in pairs(package.loaded) do
    if pkg:match("^my_.+") then
      print(pkg)
      package.loaded[pkg] = nil
      if cache then
        cache[pkg] = nil
      end
    end
  end
   dofile(vim.env.MYVIMRC)
  vim.notify("Config reloaded!", vim.log.levels.INFO)
end

return M
