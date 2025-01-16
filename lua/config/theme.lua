local M = {}

local update = function(group, opts)
  local current_hl = vim.api.nvim_get_hl(0, { name = group })
  vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", current_hl, opts or {}))
end

local patch_diagnostic_icons = function()
  vim.diagnostic.config({
    virtual_text = false,
    signs = {
      severity_limit = "WARN",
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " ",
      },
    },
  })
end

local load_colorscheme = function()
  vim.cmd.colorscheme("tokyonight-night")

  -- update("@variable.builtin", { bold = true })
  -- update("@keyword.function", { bold = true })
  -- update("@keyword", { bold = true })
  -- update("Boolean", { bold = true })
  -- update("Include", { bold = true })
  -- update("Statement", { bold = true })
  -- update("Float", { bg = "#ff00ff" })

  -- vim.api.nvim_set_hl(0, "LineNr", { link = "Normal" })
  -- vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal" })

  -- Custom highlights for diagnostic icons
  -- update("DiagnosticSignError", { bg = "NONE" }) -- Error icon
  -- update("DiagnosticSignWarn", { bg = "NONE" }) -- Warning icon
  -- update("DiagnosticSignInfo", { bg = "NONE" }) -- Info icon
  -- update("DiagnosticSignHint", { bg = "NONE" }) -- Hint icon
end

M.setup = function(opts)
  vim.tbl_extend("force", {}, opts or {})

  load_colorscheme()
  patch_diagnostic_icons()
end

return M
