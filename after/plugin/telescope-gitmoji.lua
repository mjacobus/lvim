require("telescope").load_extension("gitmoji")

lvim.builtin.which_key.mappings['pe'] = {
  "<cmd>:Telescope gitmoji<cr>",
  "Gitmojis"
}
