" my custom statusline.

function! GetBranch()
    let l:fp = fnamemodify('%', ':h')
    return trim(system("git -C " . fp . " branch --show-current 2>/dev/null"))
endfunction

let g:current_git_branch = ""
set fillchars+=stl:─,stlnc:─
set statusline=%#CurSearch#%{&readonly?'[x]':''} " symbols for readonly, mod
set statusline+=%#SpecialChar#%{&readonly?'':'───'}
set statusline+=%#IncSearch#%{&mod?'[+]':''}%#SpecialChar#%{&mod?'':'───'}
set statusline+=%#Directory#─bn:%n──%f─ " buffer num, filepath
set statusline+=%#SpecialChar#─b:%{g:current_git_branch}── " current git branch
let g:currentmode={
   \ 'n': 'nor', 'i': 'ins', 'c': 'cmd', 't': 'trm', 'v': 'vis', 'V': 'vli',
   \ "\<C-V>": 'vbl', 'R': 'rep', 'Rv': 'vre',
   \}
set statusline+=tln:%L──%{(g:currentmode[mode()])} " total lines, current mode
augroup Nerdline
    autocmd!
    " set statusline for quickfix/location list
    autocmd BufWinEnter quickfix,loclist setlocal statusline=%#Directory#%q\ (p:%L)
    " read the git branch into a variable for the statusline
    autocmd BufWinEnter * let g:current_git_branch = GetBranch()
augroup END
