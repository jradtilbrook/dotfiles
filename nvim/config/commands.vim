augroup resize_windows
  autocmd!
  autocmd VimResized * :wincmd =
augroup END
