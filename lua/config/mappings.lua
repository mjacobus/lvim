local alternative_file = require("lib/alternative_file")
-- lvim.lsp.buffer_mappings.normal_mode['<leader>q'] = { "<cmd>bdelete<cr>",  "Show documentation" }
-- lvim.keys.normal_mode["<leader>q"] = { "<cmd>bdelete<cr>", "close buffer" }

-- 'which_key' means prefixed by <leader>
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<cr>", "Quit" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>bdelete<cr>", "close buffer" }
lvim.builtin.which_key.mappings["bdd"] = { "<cmd>bdelete!<cr>", "close buffer!" }
lvim.builtin.which_key.mappings["bda"] = { "<cmd>bufdo %bd!<cr>", "close all buffers!" }

-- Notes
lvim.keys.normal_mode['<leader>et'] = ':e ~/.tmp/notes/' -- TODO: Fix this. NvimTree matches <leader>e and then messes this up
lvim.keys.normal_mode['<leader><leader>et'] = ':e ~/.tmp/notes/'
lvim.keys.normal_mode['<leader><leader>on'] = ':e ~/.tmp/notes/notes.md<cr>'
lvim.keys.normal_mode['<leader><leader>con'] = ':e .tmp/notes/notes.md<cr>'

-- TODO: how to add more meaningful comments
lvim.keys.insert_mode["jj"] = "<ESC>"
-- lvim.keys.normal_mode["<leader>qq"] = ":q!<cr>" -- does not work
lvim.builtin.which_key.mappings.q.q = { "<cmd>:q!<cr>", "Quit force" }

-- This closes the terminal, I.E. after a test run
lvim.keys.normal_mode["<leader>j"] = function()
  CloseTerminalBuffer(true)
end

lvim.keys.normal_mode["<leader>k"] = function()
  CloseTerminalBuffer(false)
end

lvim.builtin.which_key.mappings.f = { '/', "Search alias" }
lvim.builtin.which_key.mappings.F = { '<cmd>nohlsearch<cr>', "Remove search highlight" }

lvim.keys.normal_mode['<leader>af'] = '<c-^>' -- alternative file

-- " Avoid arrow keys in command mode
vim.keymap.set('c', '<C-h>', '<left>')
vim.keymap.set('c', '<C-j>', '<down>')
vim.keymap.set('c', '<C-k>', '<up>')
vim.keymap.set('c', '<C-l>', '<right>')
vim.keymap.set('c', '<C-x>', '<del>')

lvim.keys.normal_mode["<leader>ak"] = function()
  alternative_file.open('next', '--exists')
end

lvim.keys.normal_mode["<leader>aj"] = function()
  alternative_file.open('prev', '--exists')
end


vim.diagnostic.config({ virtual_text = false })

-- Running tests
-- vim.api.nvim_set_keymap('n', '<Leader>T', ':lua RunTestFile()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>t', ':lua RunTestLineByLine()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>at', ':lua RunAllTests()<CR>', { noremap = true })

lvim.builtin.which_key.mappings["T"] = { ":lua RunTestFile()<CR>", "Run test file" }
lvim.builtin.which_key.mappings["t"] = { ":lua RunTestLineByLine()<CR>", "Run test for current line" }
lvim.builtin.which_key.mappings["at"] = { ":lua RunAllTests()<CR>", "Run all tests" }
lvim.builtin.which_key.mappings.s.t = { ":lua RunShellTest()<CR>", "Run ./shell_test" }
