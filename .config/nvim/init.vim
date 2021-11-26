let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'Yggdroot/indentLine'
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'crusoexia/vim-monokai'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

" basic settings
lua require('basic')

" keybindings
lua require('keybindings')


" autocmds
" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" hightlight on yank
if has('nvim-0.5.0')
  autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
endif

" Make cursor to stay at the place where it was at previous file exit when opening the file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

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

" autocmd FileType latex,tex,md,markdown,text setlocal spell
" expand gnuplot extensions
autocmd BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot

" set background=dark " or light if you want light mode
colorscheme monokai
set tags=./.tags;,.tags
