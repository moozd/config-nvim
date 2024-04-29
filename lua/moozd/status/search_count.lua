return function()
  if vim.v.hlsearch == 0 then
    return ""
  end

  local ok, result = pcall(vim.fn.searchcount, { maxcount = 9999, timeout = 200 })
  if not ok or next(result) == nil then
    return ""
  end

  local denominator = math.min(result.total, result.maxcount)

  return string.format("%s %d/%d", "", result.current, denominator)
end
