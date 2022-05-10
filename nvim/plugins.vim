" Simplify management of vim configuration
Plug 'jesseleite/vim-sourcery'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope and dependencies
Plug 'nvim-lua/plenary.nvim' | Plug 'nvim-lua/popup.nvim' | Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" LSP stuff
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

let g:sourcery#explicit_plugin_bindings = {
  \ 'williamboman/nvim-lsp-installer': 'lspconfig',
  \ }

" Fancy commands for running tests
Plug 'vim-test/vim-test'

" Cool statusline
Plug 'nvim-lualine/lualine.nvim'

" Colorschemes
Plug 'projekt0n/github-nvim-theme'

" Syntax highlighting for Laravel Blade
Plug 'jwalton512/vim-blade'

" Smart comments with keybindings
Plug 'preservim/nerdcommenter'

" Automatically clear search highlighting when moving
" TODO: im not sure if i like this because scrolling/jumping with ctrl+d turns off highlighting which i use quite a bit
Plug 'jesseleite/vim-noh'

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
