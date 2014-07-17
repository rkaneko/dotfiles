" filetype cpp config

" switch cpp and hpp file
call altr#remove_all()
call altr#define('%.hpp', '%.cpp')

nmap <Space>a <Plug>(altr-forward)

autocmd FileType cpp inoremap <buffer><expr>; <SID>expand_namespace()

function! s:expand_namespace()
    let s = getline('.')[0:col('.')-1]
    if s =~# '\<b;$'
        return "\<BS>oost::"
    elseif s =~# '\<s;$'
        return "\<BS>td::"
    elseif s =~# '\<d;$'
        return "\<BS>etail::"
    else
        return ';'
    endif
endfunction
