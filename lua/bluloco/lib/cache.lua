local config = require("bluloco").config
local compile_path = "lua/bluloco/cache"
local cache_path = compile_path .. "/" .. config.theme .. ".lua"

local M = {}


M.exists = function()
  if config.disable_cache then
    return false
  end
  return vim.fn.filereadable(cache_path) == 1
end

M.write = function(colors)
  local serpent = require("bluloco.lib.serpent")
  local str = serpent.dump(colors)
  local file = io.open(cache_path, "wb")
  file:write(str)
  file:close()
end

M.read = function()
  local colors = require('bluloco.cache.' .. config.theme)
  if not colors then
    return nil
  end
  return colors
end

return M
