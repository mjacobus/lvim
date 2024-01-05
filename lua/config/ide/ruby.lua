-- Ruby IDE

local M = {}


-- https://github.com/neovim/nvim-lspconfig/issues/1886#issuecomment-1201356197
local solargraph_cmd = function()
  local ret_code = nil
  local jid = vim.fn.jobstart("bundle info solargraph", { on_exit = function(_, data) ret_code = data end })
  vim.fn.jobwait({ jid }, 5000)
  if ret_code == 0 then
    return { "bundle", "exec", "solargraph", "stdio" }
  end
  return { "solargraph", "stdio" }
end

_timers = {}
local function setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      local diagnostic_items = {}
      if result then
        diagnostic_items = result.items
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end

M.plugins = {
  { "olimorris/neotest-rspec" },
}

M.treesitter = {
  ensure_installed = { "ruby" }
}

M.format_on_save = {
  pattern = { "*.rb" }
}

M.setup = function()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    { command = "rubocop", filetypes = { "rb" } },
  }

  local lsp_manager = require("lvim.lsp.manager")
    lsp_manager.setup("solargraph", {
      -- cmd = { "bundle", "exec", "solargraph", "stdio" }
      cmd = { "solargraph", "stdio" }
    })
  -- lsp_manager.setup("ruby_ls", {
  --   cmd = { "bundle", "exec", "ruby-lsp" },
  --   on_attach = function(client, buffer)
  --     setup_diagnostics(client, buffer)
  --   end,
  -- })
end


return M
