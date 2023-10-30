-- this messes up project root by changing pwd

return {
  -- Colorschemes
  { 'mhartington/oceanic-next' },
  { 'folke/tokyonight.nvim' },
  { 'chriskempson/vim-tomorrow-theme' },
  { 'jlanzarotta/colorSchemeExplorer' },
  { 'shaunsingh/solarized.nvim' },

  -- GitHub
  -- { 'pwntester/octo.nvim'},
  {
    'tyru/open-browser-github.vim',
    dependencies = { { 'tyru/open-browser.vim' } }
  },
  {
    'mattn/gist-vim',
    dependencies = { { 'mattn/webapi-vim' } }
  },

  {
    "Dynge/gitmoji.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    opts = {
      completion = {
        complete_as = "text"
      }
    },
    ft = "gitcommit",
  },

  { "hrsh7th/cmp-calc" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "JMarkin/cmp-diag-codes" },
  { "uga-rosa/cmp-dictionary" },
  { "f3fora/cmp-spell" },
  { "petertriho/cmp-git" },
  { "hrsh7th/cmp-emoji" },
  { "hrsh7th/cmp-nvim-lua" },
  -- TODO: Consider https://github.com/dmitmel/cmp-cmdline-history
  -- TODO: Consider https://github.com/hrsh7th/cmp-cmdline
  -- TODO: Consider https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
  -- TODO: Consider https://github.com/amarakon/nvim-cmp-buffer-lines
  -- TODO: Consider: https://github.com/nvim-orgmode/orgmode

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },

  -- Telescope extensions
  { "mjacobus/telescope-gitmoji.nvim" },
  { "xiyaowong/telescope-emoji.nvim" },


  -- misc
  {
    'folke/todo-comments.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "AckslD/nvim-trevJ.lua",
    config = function()
      require("trevj").setup()
    end,
  },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-fugitive' },
  { 'Lokaltog/vim-easymotion' },
  { "folke/zen-mode.nvim" },
  { "laytan/cloak.nvim" },
  { 'mattn/emmet-vim' },
  { "folke/trouble.nvim" }, -- @see gh page,
  { "cappyzawa/trim.nvim" },
  { 'nvim-treesitter/nvim-treesitter' },
  { "nvim-treesitter/nvim-treesitter-context" }, -- keep the function name at the top of the file
  { "theprimeagen/harpoon" },
  { "theprimeagen/refactoring.nvim" },
  { "mbbill/undotree" },
  { 'rking/ag.vim' },
  { 'godlygeek/tabular' },
  { 'mechatroner/rainbow_csv' },
  { 'nacro90/numb.nvim' }, -- numb.nvim is a Neovim plugin that peeks lines of the buffer in non-obtrusive way.

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  },

  { "olimorris/neotest-rspec" },

  { 'norcalli/nvim-colorizer.lua' },

  -- my old plugins
  -- { 'tpope/vim-speeddating' },
  -- { 'tpope/vim-rails' },
  -- { 'mjacobus/vim-snippets',  dependencies = { { 'sirver/ultisnips' } } },
  -- { 'austintaylor/vim-commaobject' },

  -- ruby
  -- { 'noprompt/vim-yardoc' }
  -- { 'hallison/vim-rdoc' },

  -- javascript
  -- { 'kchmck/vim-coffee-script' },
  -- Should use it?
  -- { 'HerringtonDarkholme/yats.vim' },
  -- { 'pangloss/vim-javascript' },
  -- { 'MaxMEllon/vim-jsx-pretty' },
  -- { 'styled-components/vim-styled-components' },
  -- { 'elzr/vim-json' },
  -- { 'jparise/vim-graphql' },

  -- colors @see https://vimcolorschemes.com/
  -- { 'mhartington/oceanic-next' },
  -- { 'chriskempson/base16-vim' },
  -- { 'drewtempelmeyer/palenight.vim' },
  -- { 'folke/tokyonight.nvim' },
  -- { { "catppuccin/nvim", as = "catppuccin" } },
  -- { 'patstockwell/vim-monokai-tasty' },
  -- { 'kartikp10/noctis.nvim' },
  -- { 'Almo7aya/neogruvbox.nvim' },
  -- { 'nocksock/bloop.nvim', dependencies = { { 'rktjmp/lush.nvim' } } },
  -- { 'aswathkk/DarkScene.vim' },
  -- { 'Mofiqul/vscode.nvim' },
  -- { "github/copilot.vim" },
  -- { "eandrju/cellular-automaton.nvim" },

  -- LSP add ons
  -- Autocompletion
  -- { 'hrsh7th/nvim-cmp' },
  -- { 'saadparwaiz1/cmp_luasnip' },
  -- { 'quangnguyen30192/cmp-nvim-ultisnips' },
  -- { 'hrsh7th/cmp-nvim-lsp' },
  -- { 'hrsh7th/cmp-nvim-lua' },
  -- Snippets
  -- { 'L3MON4D3/LuaSnip' },
  -- { 'rafamadriz/friendly-snippets' },
}
