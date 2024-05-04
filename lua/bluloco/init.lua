local M = {}

local defaultConfig = {
  theme = "dark",
  terminal = true,
  disable_cache = false,
  dev = false,
}

M.config = defaultConfig

function M.reload()
  require("bluloco.colorscheme")
end

function M.setup(options)
  M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})
  if M.config.dev then
    local path = require("bluloco.lib.path")
    require("bluloco.lib.hotreload").watch(path.palette_colors)
  end
end

return M
