" ------------------------------------------------------------------------------
" # Neoformat Config
" ------------------------------------------------------------------------------

let g:neoformat_enabled_php = ['phpcsfixer']

augroup neoformat_on_save
  autocmd!
  autocmd BufWritePre *.php if expand('%:t') !~ '.blade.php' | call RunNeoformat()
augroup END


" ------------------------------------------------------------------------------
" # Toggle Neoformat
" ------------------------------------------------------------------------------

let s:neoformat_enabled = 1

function! RunNeoformat()
  if s:neoformat_enabled
    Neoformat
  endif
endfunction

function! ToggleNeoformat()
  if s:neoformat_enabled
    let s:neoformat_enabled = 0
    echo 'Neoformat disabled'
  else
    let s:neoformat_enabled = 1
    echo 'Neoformat enabled'
  endif
endfunction
