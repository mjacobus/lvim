local runner = require("lib/command_runner")

function RunInTerminal(cmd, open_new_tab)
  runner.run_in_terminal(cmd, open_new_tab)
end

function RunTestFile()
  local current_path = vim.fn.expand('%:p')
  local cmd = "run_test " .. current_path
  RunInTerminal(cmd, true)
end

function RunTestLineByLine()
  local current_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local current_path = vim.fn.expand('%:p')
  local cmd = "run_test " .. current_path .. " --line=" .. current_line
  RunInTerminal(cmd, true)
end

function RunAllTests()
  local current_path = vim.fn.expand('%:p')
  local cmd = "run_test " .. current_path .. ' --all'
  RunInTerminal(cmd, true)
end

function CloseTerminalBuffer()
  local name = vim.api.nvim_buf_get_name(0)

  if string.find(name, "term://") then
    -- ONLY if we it is not in a new tab
    -- local number = vim.api.nvim_buf_get_number(0)
    -- vim.api.nvim_exec('buffer #', true)
    -- vim.api.nvim_buf_delete(number, { force = true })

    vim.api.nvim_command("bdelete")
  end
end
