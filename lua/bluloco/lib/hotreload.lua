local serpent = require("bluloco.lib.serpent")
local uv = vim.loop

local function get_plugin()
  local plug = require("lazy.core.config").plugins["bluloco.nvim"]
  return plug
end

local on_event = function(err, filename, events)
  if err then
    vim.notify("Error in bluloco.nvim dev fs_event: " .. err)
  else
    if events.change == nil then
      return
    end
    local plugin = get_plugin()
    require("lazy.core.loader").reload(plugin)
    require("bluloco").reload()
  end
end

local M = {}

M.watch = function(path)
  local handle = uv.new_fs_event()

  local flags = {
    watch_entry = false,
    stat = false,
    recursive = false,
  }

  local event_cb = function(err, filename, events)
    if err then
      vim.notify("Error in bluloco.nvim dev fs_event: " .. err)
    else
      vim.schedule(function()
        on_event(err, filename, events)
      end)
    end
  end

  uv.fs_event_start(handle, path, flags, event_cb)
end

return M
