vim.cmd([[
  setlocal ts=2
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
]])

vim.cmd([[
  autocmd FileType javascript nnoremap <buffer> <leader>x :lua RunInTerminal("node " .. vim.fn.expand('%'), true)<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>cs :lua RunInTerminal("./node_modules/.bin/prettier --write  " .. vim.fn.expand('%'), true)<CR>
]])
