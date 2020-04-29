" Remove vi compatiblity
set nocompatible

filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
" Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'crusoexia/vim-monokai'
Plug 'ludovicchabant/vim-gutentags'
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': { -> mkdp#util#install() } }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-fugitive'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex', {'for': 'latex'}
call plug#end()


""""""""""""""""""""""""""
" Settings native to vim "
""""""""""""""""""""""""""

" Use filetypes for indentation.
filetype plugin indent on

" set paste

" Indent automatically
set autoindent

" Replace tabs with spaces
set expandtab

" Tabs are alligned to 4-space interval
set tabstop=4

" Tabs are 4 spaces.
set shiftwidth=4

set softtabstop=4

" Show line number
set number
" set relativenumber
set cursorline

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
" match ErrorMsg '\%81v.\+'
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey guibg=white

set nowrap

" Do not create swap files
set nobackup
set noswapfile


" Syntax Highlight
syntax enable
" set background=light    "设置背景色"
" set t_Co=16
" set termguicolors
colorscheme monokai
" colorscheme default "solarized

" Allow backspace to delete to the line above
set backspace=indent,eol,start

" Make cursor to stay at the place where it was at previous file exit when opening the file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set sidescroll=1

" Remove trailing whitespace
if !exists("*StripTrailingWhitespace")
  function StripTrailingWhitespace()
    if !&binary && &filetype != 'diff' && &filetype != 'markdown' && &filetype != 'csv' && &filetype != 'tex' && &filetype != 'txt'
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


" Enforcing Navigation Purity
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <left> <Nop>
" noremap <Right> <Nop>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More Natural Split Opening
set splitbelow
set splitright

let mapleader=' '

set showcmd
set wildmenu
set pastetoggle=<F2>

set hidden


set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Easy navigation among tabs
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>k :bnext<CR>

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv


" make undor available after closing files
set undofile
set undodir=~/.vim/undodir


" on Ubuntu
if has("win32")
  "Windows options here
else
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            set clipboard=unnamed
            "Mac options here
        else
            set clipboard=unnamedplus
        endif
    endif
endif


""""""""""""""""""""""""""
" Settings of IndentLine "
""""""""""""""""""""""""""
let g:indentLine_char = '⦙'
let g:indentLine_char='┆'
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1

""""""""""""""""""""""""
" Settings of NERDTree "
""""""""""""""""""""""""
" open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
let NERDTreeQuitOnOpen = 0



"""""""""""""""""""""""""""""
" Settings of NERDCommenter "
"""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' },
            \ 'python': {'left': '#'}, }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

""""""""""""""""""""""
" Settings of vim-go "
""""""""""""""""""""""
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1


"""""""""""""""""""""""
" Settings of airline "
"""""""""""""""""""""""
" let g:airline_solarized_bg='dark'
" let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""""
" Settings of python-syntax "
"""""""""""""""""""""""""""""
let g:python_highlight_all = 1



"""""""""""""""""""""""""
" settings of gutentags "
"""""""""""""""""""""""""
" Turn on error tracing
" let g:gutentags_trace = 0
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_exclude_filetypes = ['csv', 'json', 'markdown']
let g:gutentags_ctags_exclude = ["*.csv"]

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建
" if !isdirectory(s:vim_tags)
   " silent! call mkdir(s:vim_tags, 'p')
" endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

set tags=./.tags;,.tags
set statusline+=%{gutentags#statusline()}


""""""""""""""""""""""""""""""""
"     settings of LeaderF      "
""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<c-p>'
" let g:Lf_ShortcutB = '<m-n>'
" nnoremap <Leader>h :tabprevious<CR>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>ff :LeaderfFunction!<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>ft :LeaderfBufTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 1
" let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}



""""""""""""""""""""""""""""""""
" settings of markdown-preview "
""""""""""""""""""""""""""""""""
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = '/Users/zxxia/.vim/plugged/markdown-preview.nvim/solarized_dark.css'

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
nmap <leader>s <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle


"""""""""""""""""""
" settings of coc "
"""""""""""""""""""

" always show signcolumn
set signcolumn=yes

set updatetime=300
" Better display for messages
set cmdheight=2
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" coc extentions
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-python',
  \ 'coc-tag',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-markdownlint',
  \ 'coc-vimtex',
  \ 'coc-snippets',
  \ ]


""""""""""""""""""""""
" settings of vimtex "
""""""""""""""""""""""
