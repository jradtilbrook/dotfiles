" Automatic installation of vim-plug
" Copied from https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation (with edits for only neovim)
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
    source ~/.config/nvim/plugins.vim
call plug#end()


call sourcery#init()
