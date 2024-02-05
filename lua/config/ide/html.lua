-- HTML Ide
-- @see https://github.com/LunarVim/starter.lvim/blob/php-ide/config.lua
local M = {}

M.plugins = {
}

M.treesitter = {
  ensure_installed = { "html" }
}

M.format_on_save = {
  pattern = { "*.erb", "*.html" }
}

M.setup = function()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    { command = "prettier", filetypes = { "html" } }
  }

  local lsp_manager = require("lvim.lsp.manager")
  lsp_manager.setup("html", {
    filetypes = { "html" },
    embeddedLanguages = {
      css = true,
      javascript = true,
      typescript = true,
      javascriptreact = true,
      typescriptreact = true,
    },
  })
end

return M
