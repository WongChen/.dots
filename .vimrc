" basics
set nocompatible

filetype on

filetype plugin on

filetype plugin indent on

set autoindent

set smartindent

set nu!

set hlsearch

set tabstop=4

set wrap!

set backspace=indent,eol,start

set encoding=utf-8

syntax enable

filetype indent on

syntax on

au FileType python set cindent shiftwidth=4

au FileType cpp set cindent shiftwidth=4 " esc mapping

set relativenumber

set ruler

" bundle, vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'davidhalter/jedi'

Bundle 'Valloric/YouCompleteMe'

Bundle 'jiangmiao/auto-pairs'

Bundle 'scrooloose/nerdcommenter'

Bundle 'Vimjas/vim-python-pep8-indent'

Bundle 'lervag/vimtex'

Bundle 'junegunn/vader.vim'

Bundle 'flazz/vim-colorschemes'

" vimtex
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'

set iskeyword+=:

autocmd BufEnter *.tex set sw=2

" key map
inoremap jk <ESC>l

inoremap <C-a> <backspace>

inoremap <C-d> <Right><backspace>

map <S-e> $

let mapleader = "\<Space>"

imap xz <ESC>o

imap zx <Up><ESC>o

map <CR> <S-v>

vmap <silent> <expr> p <sid>Repl()

nnoremap <Leader>zz :wq<CR>

nnoremap <Leader>w :w<CR>

nnoremap <Leader>pp :!python %<CR>

" useful function
function! RestoreRegister()
		let @" = s:restore_reg
		return ''
endfunction

function! s:Repl()
		let s:restore_reg = @"
		return "p@=RestoreRegister()<cr>"
endfunction

" unknown
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

" YouCompleteMe
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
"let g:ycm_min_num_of_chars_for_completion=2


" auto-pair
let g:AutoPairsShortcutToggle = '<C-p>'

" haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
