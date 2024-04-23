-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

require("config.globals")
require("config.mappings")

safe_require = require("user.utils").safe_require

lvim.builtin.project.active = false

----------------------------------------------------------------------------
-- CMP config - see https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
----------------------------------------------------------------------------

safe_require("gitmoji", function(lib)
  table.insert(lvim.builtin.cmp.sources, { name = "gitmoji" })
end)

safe_require("cmp_calc", function(lib)
  table.insert(lvim.builtin.cmp.sources, { name = "cmp_calc" })
end)

safe_require("cmp_nvim_lsp_signature_help", function(lib)
  table.insert(lvim.builtin.cmp.sources, { name = "nvim_lsp_signature_help" })
end)

safe_require("cmp_diag_codes", function(lib)
  table.insert(lvim.builtin.cmp.sources, { name = "diag-codes", option = { in_comment = true} })
end)

safe_require("cmp_dictionary", function(lib)
  table.insert(lvim.builtin.cmp.sources, { name = "dictionary", keyword_length = 2 })
end)

safe_require("cmp_git", function(lib)
  table.insert(lvim.builtin.cmp.sources, { name = "git" })
end)

safe_require("cmp_emoji", function(lib)
  table.insert(lvim.builtin.cmp.sources, { name = "emoji" })
end)

safe_require("cmp-spell", function(lib)
  vim.opt.spell = true
  vim.opt.spelllang = { 'en_us' }

  table.insert(
    lvim.builtin.cmp.sources,
    {
      name = "spell",
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end,
      },
    }
  )
end)

lvim.plugins                             = require("config.plugins")
lvim.builtin.treesitter.ensure_installed = {}
lvim.format_on_save.enabled              = true
lvim.format_on_save.pattern              = {}

lvim.builtin.telescope.defaults.layout_config = {
  width = 0.9
}

require("config.ides").setup(
  lvim,
  {
    require("config.ide.lua"),
    require("config.ide.javascript"),
    require("config.ide.html"),
    require("config.ide.php"),
    require("config.ide.python"),
    require("config.ide.ruby")
  }
)

require("user.utils").safe_require("neotest", function(neotest)
  neotest.setup({
    adapters = {
      require('neotest-rspec')({
        rspec_cmd = function()
          return vim.tbl_flatten({
            "bundle",
            "exec",
            "rspec",
          })
        end
      }),
      require("neotest-python")({
        dap = { justMyCode = false },
      }),
      require('neotest-phpunit')({
        phpunit_cmd = function()
          return "vendor/bin/phpunit"
        end
      }),
      -- require("neotest-plenary"),
      -- require("neotest-vim-test")({
      --   ignore_file_types = { "python", "vim", "lua" },
      -- }),
    },
  })
end)

-- set comment color a few seconds after the editor is opened
-- So as to win a race condition with a plugin, I think
vim.defer_fn(function()
  vim.cmd [[highlight Comment cterm=italic gui=italic guibg=#4c4e69 guifg=#1a1b26]]
end, 100)
