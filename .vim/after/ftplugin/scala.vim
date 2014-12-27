" sort scala import
let g:scala_sort_across_groups=1

" for sbt
function! s:start_sbt()
    if !has_key(t:, 'sbt_cmds')
    "let t:sbt_cmds = [input('t:sbt_cmds[0] = ')]
         let t:sbt_cmds = ['compile']
         echo "let t:sbt_cmd = 'compile'"
     endif
     execute "VimShellInteractive --split='below split \| resize 12' sbt"
     stopinsert
     let t:sbt_bufname = bufname('%')
"         wincmd J
"         wincmd p
endfunction

command! -nargs=0 StartSBT call <SID>start_sbt()

function! s:sbt_run()
    if !has_key(t:, 'sbt_cmds')
        echoerr 'please give t:sbt_cmds a list'
        return
    endif

    let sbt_bufname = get(t:, 'sbt_bufname')
    if sbt_bufname !=# ''
        " go to the window
        let wn = bufwinnr(sbt_bufname)
        execute wn . 'wincmd w'
        " whew
        normal! Gzt
        " go back to the previous window
        wincmd p

        call vimshell#interactive#set_send_buffer(sbt_bufname)
        call vimshell#interactive#send(t:sbt_cmds)
        " explosion
        "call vimproc#system_bg('curl -s http://localhost:8080/requests/status.xml?command=pl_play')
    else
        echoerr 'try StartSBT'
    endif
endfunction

nnoremap <buffer> <Space>m :<C-u>write<Cr>:call <SID>sbt_run()<Cr>
nnoremap <buffer> <Space>st :<C-u>StartSBT
nnoremap <buffer> <Space>vsi :<C-u>VimShellInteractive --split='below split \| resize 12' scala<Cr>
