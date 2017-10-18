set nocompatible

filetype on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin on

Bundle 'gmarik/vundle'

Bundle 'davidhalter/jedi'

Bundle 'Valloric/YouCompleteMe'

Bundle 'jiangmiao/auto-pairs'

Bundle 'scrooloose/nerdcommenter'

Bundle 'Vimjas/vim-python-pep8-indent'

set autoindent

set smartindent

set nu!

set hlsearch

set tabstop=4

set wrap!

set backspace=indent,eol,start

"set cursorline

"set cursorcolumn

set encoding=utf-8

syntax enable

filetype indent on

syntax on

au FileType python set cindent shiftwidth=4


au FileType cpp set cindent shiftwidth=4 " esc mapping

set relativenumber

set ruler

inoremap jk <ESC>l
inoremap <C-a> <backspace>
inoremap <C-d> <Right><backspace>
map <S-e> $
map <C-a> ^
" CAOSLOCK mapping ctrl
"inoremap CAPSLOCK <C>
" shift $ mapping ctrl 0
" leader key
let mapleader = "\<Space>"

"imap <C><CR> jko
imap xz <ESC>o
imap zx <Up><ESC>o

map <CR> <S-v>

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

nnoremap <Leader>zz :wq<CR>
nnoremap <Leader>w :w<CR>
"auto clode scratch preview
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

" YouCompleteMe
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |          " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
"let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项"


" auto-pair
let g:AutoPairsShortcutToggle = '<C-p>'
"let g:AutoPairsFlyMode = 0


" markdown
