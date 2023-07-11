local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader><leader>a", function()
  mark.add_file()
  print "Added to harpoon"
end)

vim.keymap.set("n", "<leader><leader>d", function()
  mark.rm_file()
  print "Reoved from harpoon"
end)

vim.keymap.set("n", "<leader><leader>dd", function()
  mark.clear_all()
  print "Cleared harpoon marks"
end)
vim.keymap.set("n", "<leader><leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>d", function() ui.nav_prev() end)
vim.keymap.set("n", "<leader>k", function() ui.nav_next() end)
