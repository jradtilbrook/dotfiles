" Default indenting (this should be modified by style plugins or editorconfig)
augroup default_filetype_settings
    autocmd!
    autocmd FileType blade setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab iskeyword+=$
    autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab iskeyword+=$
augroup END
