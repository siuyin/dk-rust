set nocompatible

call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/vim-lsp'
call plug#end()

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

syntax enable
filetype plugin indent on
let g:rustfmt_autosave = 1
