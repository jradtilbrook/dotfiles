Plug 'folke/trouble.nvim'

" Simplify management of vim configuration
Plug 'jesseleite/vim-sourcery'

" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plugin that shows method context header (useful for exploring new repos or old ones)
Plug 'nvim-treesitter/nvim-treesitter-context'

" Telescope and dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" live grep
" 'nvim-telescope/telescope-live-grep-raw.nvim'

" LSP stuff
Plug 'williamboman/nvim-lsp-installer'
" Quickstart config for the nvim LSP client
Plug 'neovim/nvim-lspconfig'

let g:sourcery#explicit_plugin_bindings = {
  \ 'williamboman/nvim-lsp-installer': 'lspconfig',
  \ }

" Completion
" check youtube video from tj devries on cmp
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
Plug 'norcalli/nvim-colorizer.lua'

Plug 'editorconfig/editorconfig'

" Syntax highlighting for Laravel Blade
Plug 'jwalton512/vim-blade'

" Terraform highlighting
Plug 'hashivim/vim-terraform'

" Niceness for Go
" Plug 'fatih/vim-go' ", { 'for': ['go', 'gotmpl'], 'do': ':GoUpdateBinaries' }

" Smart comments with keybindings
Plug 'numToStr/Comment.nvim'

" Some better switching between files
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-projectionist'

" time tracking
Plug 'wakatime/vim-wakatime'

" More smarts for PHP
Plug 'phpactor/phpactor'

" Window resizer
" Plug 'hsanson/vim-winmode'
" Better window swap <leader>ww
" Plug 'wesQ3/vim-windowswap'

" Code formatter
" can this do stuff like ale can?
" Plug 'sbdchd/neoformat'

" Laravel Tinkeray
Plug 'jesseleite/vim-tinkeray'

" Git gutters
Plug 'lewis6991/gitsigns.nvim'

" Git/Github helpers
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" GraphQL filetype
Plug 'jparise/vim-graphql'

" Improve behaviour of built-in netrw
Plug 'tpope/vim-vinegar'

Plug 'tpope/vim-surround'

" PLUGINS TO RESEARCH
" syntax analysis and linting
" Plug 'dense-analysis/ale'
"
" custom text objects (useful for html and others?)
" 'kana/vim-textobj-user'
" 'whatyouhide/vim-textobj-xmlattr'
"
" html shorthand expansion (i think)
" 'mattn/emmet-vim'
"
" bracket pair stuff
" 'tpope/vim-unimpaired'
" 'jiangmiao/auto-pairs'
"
" git
Plug 'ThePrimeagen/git-worktree.nvim'
" 'tpope/vim-fugitive'
" 'rhubarb'
" 'ThePrimeagen/git-worktree.nvim'
"
" goyo: might be useful for pairing
"
" tmux
" Plug 'christoomey/vim-tmux-navigator' " Im not sure if i like this or would prefer to use a prefix
Plug 'preservim/vimux'
"
" show register content
" 'junegunn/vim-peekaboo'
