-- Lua IDE

local M = {}

M.plugins = {}

M.treesitter = {
  ensure_installed = { "lua" }
}

M.format_on_save = {
  pattern = { "*.lua" }
}

M.setup = function()
  -- https://www.lunarvim.org/docs/configuration/language-features/language-servers
  require("lvim.lsp.manager").setup("sumneko_lua")
end

return M
