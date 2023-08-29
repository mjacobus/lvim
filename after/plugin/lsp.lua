-- TODO: Make it work
-- vim.diagnostic.config({ virtual_text = false })

-- TODO: Learn: https://www.lunarvim.org/docs/beginners-guide/keybinds-overview#lsp

lvim.builtin.which_key.mappings['pr'] = {
  "<cmd>lua require('telescope.builtin').lsp_references()<cr>",
  "find references"
}
