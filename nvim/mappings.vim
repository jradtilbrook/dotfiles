let mapleader = ','

" Save pressing shift
nmap ; :

" Edit the alternate / previously edited file
" TODO: decide between one of these
nmap <Leader>a <C-^>
nmap <c-k><c-k> <C-^>

" Keep search results centered and open folds from vim-noh
noremap <Plug>NohAfter zz

" Keep cursor in place when joining lines
nnoremap J mzJ`z

" Add new change markers for more gradual undo
"inoremap , ,<c-g>u
"inoremap . .<c-g>u
"inoremap ! !<c-g>u
"inoremap ? ?<c-g>u
"inoremap = =<c-g>u
inoremap -> -><c-g>u

" Add relative movements to jump list so you can use ctrl-i/o
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move lines up and down
inoremap <c-j> <esc>:m .+1<cr>==a
inoremap <c-k> <esc>:m .-2<cr>==a

" Telescope
nmap <c-p> :Telescope git_files<cr>
nmap <c-k><c-p> :Telescope find_files<cr>
nmap <c-b> :Telescope buffers sort_lastused=true<cr>
nmap <c-k><c-t> :Telescope<cr>
nmap <c-k><c-d> :Telescope dotfiles<cr>
nmap <c-k><c-v> :Telescope edit_vim<cr>
" TODO: more telescope shortcuts

" Mappings: test
" TODO: leader key or <c-k><c-???> like in vs code?
nmap <silent> <leader>tn :w<cr>:TestNearest<cr>
" ctrl-k ctrl-r like vs code: testing this out instead
nmap <silent> <c-k><c-r> :w<cr>:TestNearest<cr>
nmap <silent> <leader>tf :w<cr>:TestFile<cr>
nmap <silent> <leader>ts :w<cr>:TestSuite<cr>
" tp for test previous
nmap <silent> <leader>tp :w<cr>:TestLast<cr>
nmap <silent> <leader>tv :w<cr>:TestVisit<cr>

" " Vertical split
" nmap <silent> <Leader>v :vsplit<CR>

" " Search project with ag
" " Mappings: agriculture
" nmap <Leader>/ <Plug>AgRawSearch
" vmap <Leader>/ <Plug>AgRawVisualSelection
" nmap <Leader>* <Plug>AgRawWordUnderCursor

" TODO: Check out more: https://github.com/jesseleite/dotfiles/blob/master/vim/mappings.vim#L184
imap ,, <Esc>%a,<Esc>h%i


function! SourceryMappings()
  nmap <buffer> gp <Plug>SourceryGoToRelatedPluginDefinition
  nmap <buffer> gm <Plug>SourceryGoToRelatedMappings
  nmap <buffer> gc <Plug>SourceryGoToRelatedConfig
endfunction

autocmd FileType php nmap <buffer> <silent> <c-k><c-i> :call phpactor#UseAdd()<cr>

" Make window only window
nnoremap <Leader>o <C-w>o

" Window management
" Mappings: winmode
nmap <Leader><Leader>w <Plug>WinModeResizeStart

" Mappings: neoformat
" Enable/disable formatting sometimes
nmap <Leader><Leader>n :call ToggleNeoformat()<CR>

" ------------------------------------------------------------------------------
" # Make VS Code Awesome
" Check over the keybindings and other settings from this book and apply any
" to vim
" ------------------------------------------------------------------------------



" ------------------------------------------------------------------------------
" # function/mapping to get current filename, append 'Test', pass to fzf and
" open that file - so i can jump to the test file really quickly
" ------------------------------------------------------------------------------
