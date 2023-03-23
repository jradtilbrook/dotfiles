let mapleader = ','

" Save pressing shift
nmap ; :

" Faster split movement
nmap <c-j> <c-w><c-j>
" TODO: this mapping has a pause in it because its mapped to other things like alt file and telescope - fix that (by changing the others)
nmap <c-k> <c-w><c-k>
nmap <c-h> <c-w><c-h>
nmap <c-l> <c-w><c-l>

" Edit the alternate / previously edited file
nmap <leader>a <C-^>

" search for word under cursor
nnoremap // yiw/\c<C-R>"<CR>
" remove highlighted search
nmap <leader><space> :nohlsearch<cr>

" Keep cursor in place when joining lines
" nnoremap J mzJ`z

" Add new change markers for more gradual undo
"inoremap , ,<c-g>u
"inoremap . .<c-g>u
"inoremap ! !<c-g>u
"inoremap ? ?<c-g>u
"inoremap = =<c-g>u

" Add relative movements to jump list so you can use ctrl-i/o
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Mappings: telescope
nmap <c-p> :Telescope git_files<cr>
nmap <c-p><c-p> :Telescope find_files<cr>
nmap <c-b> :Telescope buffers sort_lastused=true<cr>
nmap <c-p><c-t> :Telescope<cr>
nmap <c-p><c-d> :Telescope dotfiles<cr>
nmap <c-p><c-v> :Telescope edit_vim<cr>
" TODO: more telescope shortcuts

" Mappings: test
nmap <silent> <leader>tn :w<cr>:TestNearest<cr>
nmap <silent> <leader>tf :w<cr>:TestFile<cr>
nmap <silent> <leader>ts :w<cr>:TestSuite<cr>
nmap <silent> <leader>tl :w<cr>:TestLast<cr>
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


" Mappings: phpactor
augroup php_mappings
  autocmd!
  autocmd FileType php nnoremap <buffer> <leader>i :call phpactor#UseAdd()<cr>
  " allow undoing up to the arrow for PHP only
  autocmd FileType php inoremap <buffer> -> -><c-g>u
augroup END

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
" i think there is a plugin for this: projectionist or harpoon
" ------------------------------------------------------------------------------
