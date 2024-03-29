if has('patch-7.4.1126') && (has('python') || has('python3'))
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand("$HOME/.cache/leaderf")
    let g:Lf_ShowRelativePath = 1
    let g:Lf_UseCache = 1
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
    let g:Lf_ShowDevIcons = 0
    " let g:Lf_DefaultExternalTool='rg'
    let g:Lf_GtagsAutoGenerate = 0
    if v:version >= 802
        let g:Lf_WindowPosition = 'popup'
        let g:Lf_PreviewInPopup = 1
    endif

    let g:Lf_RgConfig = ["--max-columns=150"]

    let g:Lf_ShortcutF = '<c-p>'
    noremap <Leader>fm :LeaderfMru<cr>
    noremap <Leader>ff :LeaderfFunction!<cr>
    noremap <Leader>fb :LeaderfBuffer<cr>
    noremap <Leader>ft :LeaderfBufTag<cr>
    noremap <leader>fl :LeaderfLine<cr>
    noremap <leader>fh :LeaderfHelp<cr>

    noremap <leader>f :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
    noremap <leader>fr :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
    " search visually selected text literally
    xnoremap <leader>fr :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
    " noremap go :<C-U>Leaderf! rg --recall<CR>
else
    noremap <c-p> :GFiles -c -o --exclude-standard<cr>
endif
