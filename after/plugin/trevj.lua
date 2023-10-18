require("user.utils").safe_require("trevj", function(plugin)
  lvim.builtin.which_key.mappings.rw = {
    "<cmd>require('trevj').format_at_cursor()<CR>",
    "Rewrap arguments (one comma per line)"
  }
end)
