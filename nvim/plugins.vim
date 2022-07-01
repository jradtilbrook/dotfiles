" Simplify management of vim configuration
Plug 'jesseleite/vim-sourcery'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plugin that shows method context header (useful for exploring new repos or old ones)
Plug 'nvim-treesitter/nvim-treesitter-context'

" Telescope and dependencies
Plug 'nvim-lua/plenary.nvim' | Plug 'nvim-lua/popup.nvim' | Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" LSP stuff
Plug 'williamboman/nvim-lsp-installer'
" Quickstart config for the nvim LSP client
Plug 'neovim/nvim-lspconfig'

let g:sourcery#explicit_plugin_bindings = {
  \ 'williamboman/nvim-lsp-installer': 'lspconfig',
  \ }

" Completion
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Fancy commands for running tests
Plug 'vim-test/vim-test'

" Cool statusline
Plug 'nvim-lualine/lualine.nvim'

" Colorschemes
Plug 'projekt0n/github-nvim-theme'

Plug 'editorconfig/editorconfig'

" Syntax highlighting for Laravel Blade
Plug 'jwalton512/vim-blade'

" Terraform highlighting
Plug 'hashivim/vim-terraform'

" Smart comments with keybindings
Plug 'numToStr/Comment.nvim'

" projectionist: make switching between test file and class easy (among other things)

" time tracking
Plug 'wakatime/vim-wakatime'

" More smarts for PHP
Plug 'phpactor/phpactor'

" Window resizer
" Plug 'hsanson/vim-winmode'
" Better window swap <leader>ww
" Plug 'wesQ3/vim-windowswap'

" Code formatter
Plug 'sbdchd/neoformat'

" Git gutters
Plug 'lewis6991/gitsigns.nvim'

" Git/Github helpers
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" GraphQL filetype
Plug 'jparise/vim-graphql'

" Improve behaviour of built-in netrw
Plug 'tpope/vim-vinegar'
