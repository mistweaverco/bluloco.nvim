local config = require("bluloco").config
local path = require("bluloco.lib.path")

local M = {}

M.exists = function()
  if config.disable_cache or config.dev then
    return false
  end
  return vim.fn.filereadable(path.cache) == 1
end

M.write = function(colors)
  if (config.disable_cache or config.dev) then
    return
  end
  local serpent = require("bluloco.lib.serpent")
  local str = serpent.dump(colors)
  local file = io.open(path.cache, "wb")
  file:write(str)
  file:close()
end

M.read = function()
  if (config.disable_cache or config.dev) then
    return nil
  end
  local colors = require('bluloco.cache.' .. config.theme)
  if not colors then
    return nil
  end
  return colors
end

return M
