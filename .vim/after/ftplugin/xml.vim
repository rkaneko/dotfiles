" windowsで編集したxmlがUnixで変な風に表示されたら、整形できるかもしれない関数
" see : http://www.kaoriya.net/blog/2012/02/09/
function! s:remake_xml()
    set ft=xml
    %s/></>\r</ge
    %s/>\(\S\)/>\r\1/ge
    %s/\(\S\)</\1\r</ge
    %s/\r//ge
    :normal gg=G
endfunction

command! -nargs=0 RemakeXML call <SID>remake_xml()
