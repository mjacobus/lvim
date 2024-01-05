require("user.utils").safe_require("zen-mode", function(zen)
  vim.keymap.set("n", "<leader>zz", function()
    zen.setup {
      window = {
        width = 140,
        options = {}
      },
    }
    zen.toggle()
  end)
end)
