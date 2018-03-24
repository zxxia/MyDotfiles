" Remove vi compatiblity
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Syntastic'
call vundle#end()


""""""""""""""""""""""""""
" Settings native to vim "
""""""""""""""""""""""""""

" Use filetypes for indentation.
filetype plugin indent on

set paste

" Indent automatically
set autoindent

" Replace tabs with spaces
set expandtab

" Tabs are alligned to 4-space interval
set tabstop=4

" Tabs are 4 spaces.
set shiftwidth=4

" Show line number
set number

" Show line #, column #
set ruler

" Unix file format 
set fileformat=unix

" UTF-8 encoding
set encoding=utf8

" Enable mouse in all editing mode
set mouse=a

" Enable mouse input
set selectmode=mouse

" Ignore case difference in search
set ignorecase

" Incrementally search
set incsearch

" Highlight search results
set hlsearch

set smartcase

" Show matching parentesis, brackets, and braces
set showmatch

" Flash matching pair for 0.2 seconds.
set mat=2

" Mark characters after line is longer than 80 characters.
match ErrorMsg '\%>80v.\+'

set nowrap

" Do not create swap files
set nobackup
set noswapfile


" Syntax Highlight
syntax enable

set background=dark    "设置背景色"
colorscheme solarized
" set t_Co=16
set backspace=indent,eol,start


""""""""""""""""""""""""""
" Settings of IndentLine "
""""""""""""""""""""""""""
let g:indentLine_char = '⦙'
" let g:indentLine_char='┆'
" let g:indentLine_color_term = 239
let g:indentLine_enabled = 1


"""""""""""""""""""""""""
" Settings of Syntastic "
"""""""""""""""""""""""""
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_loc_list_height=5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
