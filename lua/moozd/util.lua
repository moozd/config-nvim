local M = {}

M.source_code_ft = {
  ---TODO: add all required sources here
}

M.icons = {
  Spotify = "",
  Docker = "󰡨",
  Stats = "󱕍",
  Jira = "󰌃",
  Redis = "",
  ActiveLSP = "",
  ActiveTS = "",
  ArrowLeft = "",
  ArrowRight = "",
  ArrowUp = "",
  ArrowDown = "",
  Bookmarks = "",
  BufferClose = "󰅖",
  DapBreakpoint = "",
  DapBreakpointCondition = "",
  DapBreakpointRejected = "",
  DapLogPoint = ".>",
  DapStopped = "󰁕",
  Debugger = "",
  DefaultFile = "󰈙",
  Diagnostic = "󰒡",
  DiagnosticError = "",
  DiagnosticHint = "󰌵",
  DiagnosticInfo = "󰋼",
  DiagnosticWarn = "",
  Ellipsis = "…",
  FileNew = "",
  FileModified = "",
  FileReadOnly = "",
  FoldClosed = "",
  FoldOpened = "",
  FoldSeparator = " ",
  FolderClosed = "",
  FolderEmpty = "",
  FolderOpen = "",
  Git = "󰊢",
  GitAdd = "",
  GitBranch = "",
  GitChange = "󰏫",
  GitConflict = "",
  GitDelete = "-",
  GitIgnored = "◌",
  GitRenamed = "➜",
  GitSign = "▎",
  GitStaged = "✓",
  GitUnstaged = "✗",
  GitUntracked = "★",
  LSPLoaded = "",
  LSPLoading1 = "",
  LSPLoading2 = "󰀚",
  LSPLoading3 = "",
  MacroRecording = "",
  Package = "󰏖",
  Paste = "󰅌",
  Refresh = "",
  Search = "",
  Selected = "❯",
  Session = "󱂬",
  Sort = "󰒺",
  Spellcheck = "󰓆",
  Tab = "󰓩",
  TabClose = "󰅙",
  Terminal = "",
  Window = "",
  WordFile = "󰈭",
}

function M.create_terminal_app(opts)
  local Terminal = require("toggleterm.terminal").Terminal
  local dir = nil
  local function build()
    dir = opts["dir"] or vim.loop.cwd()
    return Terminal:new(vim.tbl_deep_extend("force", {
      direction = "float",
      dir = dir,
      close_on_exit = true,
      hidden = true,
      float_opts = {
        border = "curved",
      },
    }, opts or {}))
    --
  end
  local t = build()

  return function()
    t:toggle()
  end
end


function M.get_hl_color(group, attr)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

function M.close_all_but_this()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    if i ~= current_buf then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end

function M.augroup(name)
  return vim.api.nvim_create_augroup("moozd_" .. name, { clear = true })
end

--- Merge extended options with a default table of options
---@param default? table The default table that you want to merge into
---@param opts? table The new options that should be merged with the default table
---@return table # The merged table
function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

--- A helper function to spread the table
---@param template table
---@return function
function M.spread(template)
  local result = {}
  for key, value in pairs(template) do
    result[key] = value
  end

  return function(table)
    for key, value in pairs(table) do
      result[key] = value
    end
    return result
  end
end

function M.which_key_register()
  if M.which_key_queue then
    local wk_avail, wk = pcall(require, "which-key")
    if wk_avail then
      for mode, registration in pairs(M.which_key_queue) do
        wk.register(registration, { mode = mode })
      end
      M.which_key_queue = nil
    end
  end
end

--- Get an empty table of mappings with a key for each map mode
---@return table<string,table> # a table with entries for each map mode
function M.empty_map_table()
  local maps = {}
  for _, mode in ipairs({ "", "n", "v", "x", "s", "o", "!", "i", "l", "c", "t" }) do
    maps[mode] = {}
  end
  if vim.fn.has("nvim-0.10.0") == 1 then
    for _, abbr_mode in ipairs({ "ia", "ca", "!a" }) do
      maps[abbr_mode] = {}
    end
  end
  return maps
end

--- A helper function to wrap a module function to require a plugin before running
---@param plugin string The plugin to call `require("lazy").load` with
---@param module table The system module where the functions live (e.g. `vim.ui`)
---@param func_names string|string[] The functions to wrap in the given module (e.g. `{ "ui", "select }`)
function M.load_plugin_with_func(plugin, module, func_names)
  if type(func_names) == "string" then
    func_names = { func_names }
  end
  for _, func in ipairs(func_names) do
    local old_func = module[func]
    module[func] = function(...)
      module[func] = old_func
      require("lazy").load({ plugins = { plugin } })
      module[func](...)
    end
  end
end

--- Table based API for setting keybindings
---@param map_table table A nested table where the first key is the vim mode, the second key is the key to map, and the value is the function to set the mapping to
---@param base? table A base set of options to set on every keybinding
function M.setup_keymap(map_table, base)
  -- iterate over the first keys for each mode
  base = base or {}
  for mode, maps in pairs(map_table) do
    -- iterate over each keybinding set in the current mode
    for keymap, options in pairs(maps) do
      -- build the options for the command accordingly
      if options then
        local cmd = options
        local keymap_opts = base
        if type(options) == "table" then
          cmd = options[1]
          keymap_opts = vim.tbl_deep_extend("force", keymap_opts, options)
          keymap_opts[1] = nil
        end
        if not cmd or keymap_opts.name then -- if which-key mapping, queue it
          if not keymap_opts.name then
            keymap_opts.name = keymap_opts.desc
          end
          if not M.which_key_queue then
            M.which_key_queue = {}
          end
          if not M.which_key_queue[mode] then
            M.which_key_queue[mode] = {}
          end
          M.which_key_queue[mode][keymap] = keymap_opts
        else -- if not which-key mapping, set it
          vim.keymap.set(mode, keymap, cmd, keymap_opts)
        end
      end
    end
  end
  if package.loaded["which-key"] then
    M.which_key_register()
  end -- if which-key is loaded already, register
end

--- Get an icon from the AstroNvim internal icons if it is available and return it
---@param kind string The kind of icon in astronvim.icons to retrieve
---@param padding? integer Padding to add to the end of the icon
---@return string icon
function M.get_icon(kind, padding)
  local icon = M["icons"] and M["icons"][kind]
  return icon and icon .. string.rep(" ", padding or 0) or ""
end

--- Serve a notification with a title of AstroNvim
---@param msg string The notification body
---@param type? number The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
function M.notify(msg, type, opts)
  vim.schedule(function()
    vim.notify(msg, type, M.extend_tbl({ title = "AstroNvim" }, opts))
  end)
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

function M.setup_commands(commands)
  local create = vim.api.nvim_create_user_command

  for cmd_name, def in pairs(commands) do
    local name = cmd_name

    if def.is_experimental then
      name = "Experimental" .. name
    end

    local action = def.fn or def.cmd or function()
      print("Empty command:" .. name)
    end

    local opts = vim.tbl_deep_extend("force", { desc = name }, def.opts)

    create(name, action, opts)
  end
end

return M
