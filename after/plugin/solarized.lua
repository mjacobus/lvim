-- after/plugin/solarized.lua
-- https://github.com/shaunsingh/solarized.nvim
-- Example config in lua

local g = "dark"

function ToggleDarkness()
  if g == "dark" then
    g = "light"
    vim.g.solarized_italic_comments = true
    vim.g.solarized_italic_keywords = true
    vim.g.solarized_italic_functions = true
    vim.g.solarized_italic_variables = false
    vim.g.solarized_contrast = true
    vim.g.solarized_borders = false
    vim.g.solarized_disable_background = false

    vim.cmd([[set background=light]])
    lvim.colorscheme = "solarized"
    require('solarized').set()
    vim.cmd([[colorscheme solarized]])
  else
    g = "dark"
    vim.opt.background = "dark"
    vim.cmd([[colorscheme lunar]])
  end
end

lvim.builtin.which_key.mappings.d.t = { '<cmd>lua ToggleDarkness()<cr>', "Toggle darkness/lightness" }
