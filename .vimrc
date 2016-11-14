set nocompatible
filetype on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'davidhalter/jedi'

Bundle 'Valloric/YouCompleteMe'

Bundle 'jiangmiao/auto-pairs'

set autoindent

set smartindent

set nu!

set hlsearch

set tabstop=4

set wrap

set cursorline

set cursorcolumn

set encoding=utf-8

syntax enable

filetype indent on

syntax on

au FileType python set cindent shiftwidth=4


au FileType cpp set cindent shiftwidth=4 " esc mapping
inoremap jk <ESC>

" CAOSLOCK mapping ctrl
inoremap CAPSLOCK <C>

" leader key
let mapleader = "\<Space>"



" END
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
nnoremap <Leader>w :w<CR>
