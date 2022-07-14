let g:test#strategy = 'vimux'

" running with pest takes precedence in vim-test but it doesn't work with sail
" so only use the phpunit runner (which has logic for running through sail)
" the default is ['Codeception', 'Dusk', 'Pest', 'PHPUnit', 'Behat', 'PHPSpec', 'Kahlan', 'Peridot']
let g:test#custom_runners = {
    \ 'PHP': ['PHPUnit'],
\}
