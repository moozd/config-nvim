local function get_null_ls_providers(filetype)
  local registered = {}
  -- try to load null-ls
  local sources_avail, sources = pcall(require, "null-ls.sources")
  if sources_avail then
    -- get the available sources of a given filetype
    for _, source in ipairs(sources.get_available(filetype)) do
      -- get each source name
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end
  end
  -- return the found null-ls sources
  return registered
end

local function get_null_ls_sources(filetype, method)
  local methods_avail, methods = pcall(require, "null-ls.methods")
  return methods_avail and get_null_ls_providers(filetype)[methods.internal[method]] or {}
end

local function lsp_client_names()
  local buf_client_names = {}
  for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    if client.name == "null-ls" then
      local null_ls_sources = {}
      for _, type in ipairs({ "FORMATTING", "DIAGNOSTICS" }) do
        for _, source in ipairs(get_null_ls_sources(vim.bo.filetype, type)) do
          if (source ~= 'cspell') then
            null_ls_sources[source] = true
          end
        end
      end
      vim.list_extend(buf_client_names, vim.tbl_keys(null_ls_sources))
    else
      table.insert(buf_client_names, client.name)
    end
  end

  return buf_client_names
end

local opts = {
  icon = "",
  seprator = "  ",
}

return function()
  local sources = lsp_client_names()

  for key in pairs(sources) do
    sources[key] = (opts.icon or "") .. " " .. sources[key]
  end

  local line = table.concat(sources, opts.seprator)

  -- local width = vim.fn.winwidth(0)
  -- if width < 50 then
  --   return ""
  -- end
  if string.len(line) == 0 then
    return ""
  end
  return line
end
