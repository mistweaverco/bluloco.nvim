local M = {}

local defaultConfig = {
  theme = "dark",
  terminal = true,
  italic_comments = true,
  disable_cache = false,
  dev = false,
}

M.config = defaultConfig

function M.reload()
  M.load()
end

function M.load()
  require('bluloco.colorscheme')
  vim.g.colors_name = 'bluloco'
end

function M.clear_cache()
  require('bluloco.lib.cache').clear()
end

function M.setup(options)
  M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})
  if M.config.dev then
    local path = require("bluloco.lib.path")
    require("bluloco.lib.hotreload").watch(path.palette_colors)
  end
end

return M
