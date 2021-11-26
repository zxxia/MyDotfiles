set nocompatible    " Remove vi compatiblity

filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
" Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries'}
" Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'crusoexia/vim-monokai'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown', 'do': { -> mkdp#util#install() } }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
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
set completeopt=longest,menuone
set undofile                " make undor available after closing files
set undodir=~/.vim/undodir
set colorcolumn=80          " Mark characters after line is longer than 80 characters.
set nostartofline
set autoread      " Reload files changed outside vim
if !has('nvim')
    set ttyfast
endif
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
highlight ColorColumn ctermbg=lightgrey guibg=white
syntax enable               " Syntax Highlight
" set background=light    "设置背景色"
" set t_Co=16
colorscheme monokai
" colorscheme default "solarized
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
" nnoremap <Leader>j :bprevious<CR>
" nnoremap <Leader>k :bnext<CR>

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

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

if has('nvim-0.5.0')
  au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
endif

" let g:python3_host_prog = '/Users/zxxia/.virtualenvs/nvim/bin/python3.9'

""""""""""""""""""""""""""
" Settings of IndentLine "
""""""""""""""""""""""""""
let g:indentLine_char='┆'
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['markdown', 'json', 'latex', 'tex', 'csv']

""""""""""""""""""""""""
" Settings of NERDTree "
""""""""""""""""""""""""
" open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeWinSize=35
" let NERDTreeQuitOnOpen = 0
" " If another buffer tries to replace NERDTree, put in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif



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
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1


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
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" let g:gutentags_exclude_filetypes = ['csv', 'json', 'markdown']
" let g:gutentags_ctags_exclude = ["*.csv"]

" 所生成的数据文件的名称
" let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建
" if !isdirectory(s:vim_tags)
   " silent! call mkdir(s:vim_tags, 'p')
" endif

" 配置 ctags 的参数
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

set tags=./.tags;,.tags
" set statusline+=%{gutentags#statusline()}


""""""""""""""""""""""""""""""""
"     settings of LeaderF      "
""""""""""""""""""""""""""""""""
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 1
let g:Lf_UseCache = 1
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_ShowDevIcons = 0
let g:Lf_DefaultExternalTool='rg'
if v:version >= 802
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 0
endif


let g:Lf_ShortcutF = '<c-p>'
" let g:Lf_ShortcutB = '<m-n>'
noremap <leader>f :LeaderfSelf<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>ff :LeaderfFunction!<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfBufTag<cr>
noremap <leader>fl :LeaderfLine<cr>
noremap <leader>fw :LeaderfWindow<cr>

nmap <unique> <leader>fr <Plug>LeaderfRgPrompt
nmap <unique> <leader>fra <Plug>LeaderfRgCwordLiteralNoBoundary
nmap <unique> <leader>frb <Plug>LeaderfRgCwordLiteralBoundary
nmap <unique> <leader>frc <Plug>LeaderfRgCwordRegexNoBoundary
nmap <unique> <leader>frd <Plug>LeaderfRgCwordRegexBoundary

vmap <unique> <leader>fra <Plug>LeaderfRgVisualLiteralNoBoundary
vmap <unique> <leader>frb <Plug>LeaderfRgVisualLiteralBoundary
vmap <unique> <leader>frc <Plug>LeaderfRgVisualRegexNoBoundary
vmap <unique> <leader>frd <Plug>LeaderfRgVisualRegexBoundary

" noremap <Leader>rb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" noremap <Leader>rf :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
" xnoremap <Leader>gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
" noremap <Leader>go :<C-U>Leaderf! rg --recall<CR>


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
" let g:mkdp_highlight_css = '/Users/zxxia/.vim/plugged/markdown-preview.nvim/github_markdown.css'

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
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set updatetime=300
" Better display for messages
set cmdheight=2

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocDiagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_disable_startup_warning = 1
" coc extentions
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-pyright',
  \ 'coc-tag',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-markdownlint',
  \ 'coc-vimtex',
  \ 'coc-snippets',
  \ 'coc-git',
  \ 'coc-explorer',
  \ ]

autocmd FileType tex let b:coc_pairs = [["$", "$"]]
" Disable file with size > 1MB
autocmd BufAdd * if getfsize(expand('<afile>')) > 1024*1024 |
            \ let b:coc_enabled=0 |
            \ endif
nnoremap <C-n> :CocCommand explorer<CR>


""""""""""""""""""""""
" settings of vimtex "
""""""""""""""""""""""
let g:tex_conceal = ""
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_progname = 'nvr'
if has('unix')
    if has('mac')
        let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'

        " This adds a callback hook that updates Skim after compilation
        augroup vimtex_compilation
            au!
            au User VimtexEventCompileSuccess call UpdateSkim()
        augroup END
        function! UpdateSkim()
            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']
            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif
            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    else
        let g:latex_view_general_viewer = "zathura"
        let g:vimtex_view_method = "zathura"
    endif
elseif has('win32')

endif
" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
