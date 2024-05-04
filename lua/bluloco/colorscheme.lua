local cache = require("bluloco.lib.cache")
local colors = {}

if cache.exists() then
  colors = cache.read()
else
  colors = require("bluloco.palette.colors")
  cache.write(colors)
end

vim.cmd("highlight clear")
vim.cmd("set t_Co=256")

for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end
