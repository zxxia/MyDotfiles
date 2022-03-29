filetype off

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'L3MON4D3/LuaSnip'

Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tanvirtin/monokai.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()



""""""""""""""""""""""""""
" Settings native to vim "
""""""""""""""""""""""""""
filetype plugin indent on   " Use filetypes for indentation.
set autoindent              " Indent automatically
set expandtab               " Replace tabs with spaces
set tabstop=4               " Tabs are alligned to 4-space interval
set shiftwidth=4            " Tabs are 4 spaces.
set softtabstop=4
set number                  " Show line number
" set relativenumber
set cursorline              " Show a horizontal line on cursorline
set ruler                   " Show line #, column #
set fileformat=unix         " Unix file format
set encoding=UTF-8          " UTF-8 encoding
set mouse=a                 " Enable mouse in all editing mode
set selectmode=mouse        " Enable mouse input
set ignorecase              " Ignore case difference in search
set incsearch               " Incrementally search
set splitbelow              " More natural split opening, cursor in bottom window
set splitright              " More natural split opening, cursor in right window
let mapleader=' '           " Set space to leader key
set showcmd
set wildmenu                " Allow command menu for better command completion
set pastetoggle=<F2>        " Press F2 to turn on paste mode
set hidden                  " When on a buffer becomes hidden when it is abandoned.
set hlsearch                " Highlight search results
set smartcase
set showmatch               " Show matching parentesis, brackets, and braces
set matchtime=2                   " Flash matching pair for 0.2 seconds.
set nowrap
set nobackup                " Do not create swap files
set noswapfile
set sidescroll=1
set scrolloff=5             " 5 lines offset between the cursor and top/bottom margin
set backspace=indent,eol,start " Allow backspace to delete to the line above
set completeopt=menu,menuone,noselect,noinsert
set undofile                " make undor available after closing files
set colorcolumn=80          " Mark characters after line is longer than 80 characters.
set nostartofline
set autoread      " Reload files changed outside vim
set termguicolors
set tags=./.tags;,.tags
set signcolumn=yes
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
syntax on               " Syntax Highlight
colorscheme monokai

if has("win32")
  "Windows options here
else
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            set clipboard=unnamed
            "Mac options here
        else
            " on linux(Ubuntu)
            set clipboard=unnamedplus
        endif
    endif
endif

" Make cursor to stay at the place where it was at previous file exit when opening the file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" Remove trailing whitespace
if !exists("*StripTrailingWhitespace")
  function StripTrailingWhitespace()
    if !&binary && &filetype != 'diff' && &filetype != 'markdown' && &filetype != 'csv' && &filetype != 'txt'
      normal mz
      normal Hmy
      %s/\s\+$//e
      normal 'yz<CR>
      normal `z
    endif
  endfunction
endif
autocmd FileWritePre    * :call StripTrailingWhitespace()
autocmd FileAppendPre   * :call StripTrailingWhitespace()
autocmd FilterWritePre  * :call StripTrailingWhitespace()
autocmd BufWritePre     * :call StripTrailingWhitespace()


" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" autocmd FileType latex,tex,md,markdown,text setlocal spell
" expand gnuplot extensions
au BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Consistent with C and D
nnoremap Y y$

" Easy navigation among tabs
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>

" Keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Keep pane split when closing a buffer
nmap <silent> <leader>d :bp\|bd #<CR>

"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
" inoremap <c-_> <c-k>

" command mode easy cursor movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <c-d> <del>

" select the highlighted item when pop-up menu is visible in command mode
cnoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Fugitive conflict resolution
" diffget from HEAD
nnoremap dgh :diffget //2<CR>
" diffget from merge branch
nnoremap dgl :diffget //3<CR>
" stop Q triggering Ex mode
nnoremap Q <Nop>

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}


autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" assume virtualenvwrapper is used and nvim is the virtualenv for neovim
let g:python3_host_prog = expand("$WORKON_HOME/nvim/bin/python")
