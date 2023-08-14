-- lvim.builtin.which_key.mappings.c.s = { ":lua RunRubocop()<CR>", "Rubocop -A file" }

-- Set the autocmd to trigger when a Ruby file is opened
vim.cmd([[
  autocmd FileType ruby nnoremap <buffer> <leader>cs :lua RunRubocop()<CR>
]])
