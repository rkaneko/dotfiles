" original is http://vim.wikia.com/wiki/JavaFX_indent_plugin

:setlocal expandtab "ソフトtabを有効に
:setlocal tabstop=2 shiftwidth=2 softtabstop=2 "インデント幅を2文字に
:setlocal autoindent "オートインデントを有効に

" set debug=msg,throw
" if exists("b:did_indent")
"   finish
" endif
"
" let b:did_indent = 1
" setlocal indentkeys=0{,0},0],!^F,o,O,e
"
" "if exists("*GetFxIndent")
" "    finish
" "endif
"
" " removes JavaFX quoted strings from a line
" function! s:removeQuotedStrings(orig_line)
"     "todo needs to be more robust
"     "right now it barely handles double and single quotes, but
"     "there could be code interpolation.
"     " see http://java.sun.com/javafx/1/tutorials/core/dataTypes/#string
"
"     let quote1 = matchstr(a:orig_line, "['\"]")
"
"     if empty(quote1)
"         return a:orig_line
"     endif
"
"     let escaped_quote = '\\' . quote1
"
"     " replace escaped quotes, for example '\\"'
"     let line = substitute(a:orig_line, escaped_quote, '__', "g")
" "    call confirm('-->' . line)
"
"     " match the quoted token, for example: /'[^']\+'/
"     let quote_pattern = quote1 . '[^' . quote1 . ']\+' . quote1
"
" "    call confirm(quote_pattern)
"     return substitute(line, quote_pattern, '""', "g")
" endfunction
"
"
" function! s:SkipJavaFxBlanksAndComments(startline)
"     let lnum = a:startline
"     while lnum > 1
"         let lnum = prevnonblank(lnum)
"         if getline(lnum) =~ '\*/\s*$'
"             while getline(lnum) !~ '/\*' && lnum > 1
"                 let lnum = lnum - 1
"             endwhile
"             if getline(lnum) =~ '^\s*/\*'
"                 let lnum = lnum - 1
"             else
"                 break
"             endif
"         elseif getline(lnum) =~ '^\s*//'
"             let lnum = lnum - 1
"         else
"             break
"         endif
"     endwhile
"     return lnum
" endfunction
"
" " meant to matche the property syntax  x : y
" let s:property_regex =  '^\s*\(\%(\i\|\s\)\+\):\(.*\)$'
"
" function! GetFxIndent()
"     if v:lnum == 1
"         return indent(v:lnum)
"     endif
"     let theCIndent = cindent(v:lnum)
"
"     " If we're in the middle of a comment or at the end of a java-like
"     " statement or block, use cindent
"     if getline(v:lnum) =~ '^\s*[\*/;]'
"         return theCIndent
"     endif
"
"     " find start of previous line, in case it was a continuation line
"     let lnum = s:SkipJavaFxBlanksAndComments(v:lnum - 1)
"     let prev_lnum = lnum
"     while prev_lnum > 1
"         let earlier_prev = s:SkipJavaFxBlanksAndComments(prev_lnum - 1)
"         if getline(earlier_prev) !~ '\%(\i\|\s\),\s*$'
"             break
"         endif
"         let prev_lnum = earlier_prev
"     endwhile
"
" "    call confirm('current indent is: ' . indent(v:lnum) .
" "                \     "\ncindent wants it to be: " . theCIndent .
" "                \     "\nprevious line num: " . prev_lnum)
"
"     " let's get rid of the contents of the strings in the line.
"     let current_line = s:removeQuotedStrings(getline(v:lnum))
"     let prev_line = s:removeQuotedStrings(getline(prev_lnum))
"
" "    call confirm('prev_line is: ' . prev_line)
"     if current_line =~ '^\s*\]'
"         return indent(prev_lnum) - &sw
"     endif
"
"     " take care of property-type format x: y
"     let captures = matchlist(prev_line, s:property_regex)
"
"     if ! empty(captures)
" "        call confirm(string(captures))
"         if captures[1] =~ '{' || captures[2] =~ '{'
" "            call confirm("if1")
"             if captures[2] =~ '}'
" "                call confirm("if2")
"                 " this may be a complete block enclosure on one line
"                 return indent(prev_lnum)
"             else
" "                call confirm("if3")
"                 " a block is starting in the property.
"                 return indent(prev_lnum)  + &sw
"             endif
" "            call confirm("if4")
"         elseif captures[0] =~ '^\s*\<\%(var\|def\)\>'
" "            call confirm("if5")
"             " what we thought was a property-type format was really a
"             " declaration of a variable.
"             return theCIndent
"         elseif current_line =~ '^\s*}'
" "                call confirm("if6")
"             " the end of the property block
"             return indent(prev_lnum) - &sw
"         elseif captures[0] =~ '['
" "            call confirm("if7")
"             " the end of the property block
"             return indent(prev_lnum) + &sw
"         else
" "            call confirm("if8")
"             return indent(prev_lnum)
"         endif
"         " end of property-type format x: y check on prev_line
"
" "        call confirm("if9")
"     elseif current_line =~ '^\s*}'
" "        call confirm("if9a")
"         return indent(prev_lnum) -&sw
"     elseif prev_line =~ '{'
" "        call confirm("if10")
"         " maybe it's a completely enclosed block.
"         " if so, we can keep the previus indent
"         if prev_line =~ '{[^}]\+}'
" "            call confirm("if11")
"             return indent(prev_lnum)
"         else
"             return indent(prev_lnum) + &sw
"         endif
"
"     elseif prev_line =~ '^\s*}'
" "        call confirm("if12")
"         if current_line =~  '^\s*}'
" "            call confirm("if13")
"             "return indent(prev_lnum) -&sw
"             "return theCIndent
"         else
" "            call confirm("if14")
"             return indent(prev_lnum)
"         endif
"     elseif match(current_line, s:property_regex) > -1
" "        call confirm("if15")
"         return indent(prev_lnum)
"     endif
"
" "    call confirm('normal flow')
"     return theCIndent
" endfunction
"
"
" " Set the function to do the work.
" setlocal indentexpr=GetFxIndent()
