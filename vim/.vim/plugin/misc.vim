""""""""""""""""""""""""""
" Settings of Airline "
""""""""""""""""""""""""""
if v:version >= 702
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#hunks#enabled = 0
    let g:airline#extensions#whitespace#enabled = 0
endif

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
"

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
" set statusline+=%{gutentags#statusline()}

" c++ syntax highlighting
" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1


""""""""""""""""""""""""""""""""""
" Settings of vim-tmux-navigator "
""""""""""""""""""""""""""""""""""
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
