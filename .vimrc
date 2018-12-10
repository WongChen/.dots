" basics
set nocompatible"{{{

filetype on

filetype plugin on

filetype plugin indent on

set hidden"}}}

" -------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


augroup NrHighlight
  autocmd!
  autocmd WinEnter * hi LineNr ctermfg=247 guifg=#9e9e9e ctermbg=233 guibg=#121212
  autocmd WinLeave * hi LineNr ctermfg=274 guifg=#e9e9e9 ctermbg=133 guibg=#212121
augroup END
" -------}}}
setlocal foldmethod=marker "{{{

set autoindent

set wrap

set smartindent

set nu!

set hlsearch

set tabstop=4

set backspace=indent,eol,start

set encoding=utf-8

set showbreak=∫

set dict+=/usr/share/dict/words

syntax enable

filetype indent on

syntax on

au FileType python set cindent shiftwidth=4

au FileType cpp set cindent shiftwidth=4 " esc mapping

set relativenumber

set ruler

" search highlight colorschemes
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red"}}}
" colorscheme
"if has("gui_running")
	"set background=light
"else
	"set background=dark
"endif

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

Bundle 'tpope/vim-surround'


" haskell monica
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc'

let g:airline#extensions#ale#enabled = 1

nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>

" key mapping for windows scroll
nnoremap <Leader>hd <C-w>h<C-d><C-w>l
nnoremap <Leader>ld <C-w>l<C-d><C-w>h
nnoremap <Leader>jd <C-w>j<C-d><C-w>k
nnoremap <Leader>kd <C-w>k<C-d><C-w>j
                                    
nnoremap <Leader>hb <C-w>h<C-d><C-w>l
nnoremap <Leader>lb <C-w>l<C-d><C-w>h
nnoremap <Leader>jb <C-w>j<C-d><C-w>k
nnoremap <Leader>kb <C-w>k<C-d><C-w>j

"Bundle 'neovimhaskell/haskell-vim'


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

"map <CR> <S-v>

vmap <silent> <expr> p <sid>Repl()

" close buffer mapping
nnoremap <Leader>bb :bd<CR>

nnoremap <Leader>zz :wq<CR>

nnoremap <Leader>w :w<CR>

nnoremap <Leader>pp :!python3 %<CR>

" buffer switch
nnoremap <silent> [b :bprevious<CR> 
nnoremap <silent> ]b :bnext<CR> 
nnoremap <silent> [B :bfirst<CR> 
nnoremap <silent> ]B :blast<CR>

" tab switch
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" screen switch
nnoremap <silent> [p <C-t>p
nnoremap <silent> ]p <C-t>n

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
let g:AutoPairsShortcutToggle = '<C-u>'
let b:autopairs_enabled=0

" haskell
"let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
"let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
