local M = {}

local defaultConfig = {
  theme = "dark",
}

M.config = defaultConfig

function M.setup(options)
  M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})
end

return M
