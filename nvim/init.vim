" dein.vim begin {{{
if &compatible
    set nocompatible
endif

let s:dein_dir = expand('~/dotfiles/nvim/bundle/dein.vim')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif
" dein.vim end }}}
" ----------------------------------------------------------------------------
filetype plugin indent on
syntax enable
" ----------------------------------------------------------------------------
" basic begin {{{
set nobackup                         " not make backup file
set autoread                         " read automatically file which is written on the other hand
set noswapfile                       " not make swap file
set textwidth=0                      " not turn up long sentence
set hidden                           " can open a file editting on the other hand
set backspace=indent,eol,start       " remove all with backspace key
set whichwrap=b,s,[,],<,>,~          " moving as screen editor
set showcmd                          " show command on the status line
set showmode                         " show current mode
set vb t_vb=                         " off beep sound
" If input contains Large letters, ignore case
set ignorecase
set smartcase
" set list                             " show white space and etc
set shortmess& shortmess+=I          " disable showing message on startup time
set imdisable                        " use IM: When u escape input mode, automatically set IME off.(Enable only KaoriYa Vim)
set iminsert=0 imsearch=0            " on startup time set IME off
set noimcmdline                      " on command line set IME off
set hlsearch                         " high light words u are searching
" clear high light with ESC + ESC
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>
set incsearch
" search view settings
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # *zvzz

nnoremap <C-Space> i<Space><Esc><Right> " insert space with C-Space

" doesn't put comment on starting new line
set formatoptions-=r
set formatoptions-=o
set fileformats=unix,dos,mac
set ttyfast
set ambiwidth=double
set whichwrap +=h
set whichwrap +=l
set history=100

if has('persistent_undo')
    if ! isdirectory($HOME.'/.nvim/undo')
        call mkdir($HOME.'/.nvim/undo', 'p')
    endif
    set undodir=~/.nvim/undo
    set undofile
endif

" open file with specifying encoding
command! -bang -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -complete=file -nargs=? Sjis edit<bang> ++enc=cp932 <args>
command! -bang -complete=file -nargs=? Euc edit<bang> ++enc=eucjp <args>

" GUI settings
if !has('nvim')
    set clipboard+=unnamed,autoselect    " use OS clipboard
    set ttymouse=xterm2
endif
set mouse=a
set guioptions+=a
" see : http://atasatamatara.hatenablog.jp/entry/2013/03/07/215806
" copy text with Ctrl+c
vmap <C-c> :w !xsel -ib<CR><CR>
" On insert mode, you can put clipped letters with Ctrl+p
imap <C-p> <ESC>"*pa

" delete buffer
function! s:delete_current_buf()
    let bufnr = bufnr('%')
    bnext
    if bufnr == bufnr('%') | enew | endif
    silent! bdelete #
endfunction
nnoremap <C-w>d :<C-u>call <SID>delete_current_buf()<CR>
nnoremap <C-w>D :<C-u>bdelete<CR>


" Ev/Rv : edit/reflect .vimrc
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

set helpfile=$VIMRUNTIME/doc/help.txt

"" tab and indent
" ref : http://goo.gl/fHiE7
set expandtab                        " If you types tab key, vim replaces tab with spaces .
set tabstop=4                        " tab is 4 spaces on vim view
set shiftwidth=4                     " auto indent config , indent width is 4 spaces
set softtabstop=4                    " If you types tab key on continuous spaces, you can move 4 spaces .
set autoindent                       " When you start new line, auto indent is available .
set smartindent                      " Whew you start new line, vim makes indent judging from line tail .

" encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,cp932,sjis,euc-jp

" turn off auto indent when pasting from clipboard
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function! XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

inoremap <C-d> <Del>

" when insert mode jj is esc
inoremap jj <Esc>

" split vertical
nnoremap sv :vs<CR>
" split horizontal
nnoremap ss :sp<CR>

" see : http://c4se.hatenablog.com/entry/2013/03/10/032917
" delete end of line spaces when saving
function! s:delete_end_of_sentence()
    let position = getpos('.')
    if &filetype !~ 'markdown'
        " autocmd BufWritePre * :%s/\s\+$//ge
        :%s/\s\+$//ge
    endif
    call setpos('.', position)
endfunction
command! DeleteEOT call s:delete_end_of_sentence()

" replace tab to space when saving except for filetype equals 'make'
function! s:replace_tab_to_space()
    let position = getpos('.')
    if &filetype !~ 'make'
        " :%s/\t/  /ge
        set expandtab
        retab
    endif
    call setpos('.', position)
endfunction

augroup vimrc_rkaneko_bufwritepre
    autocmd!
    autocmd BufWritePre * call s:replace_tab_to_space()
augroup END
" basic end }}}
" ----------------------------------------------------------------------------
" completion {{{
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,ssp setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" completion }}}
" ----------------------------------------------------------------------------
" plugins {{{

" deoplete.nvim {{{
let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 30
let g:deoplete#sources = {
    \ 'default' : '',
    \ 'c' : $HOME.'/.vim/dict/c.dict',
    \ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
    \ 'java' : $HOME.'/.vim/dict/java.dict',
    \ 'scala' : $HOME.'/.vim/dict/scala.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'php' : $HOME.'/.vim/dict/php.dict'
    \ }
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  deoplete#close_popup()
inoremap <expr><C-e>  deoplete#cancel_popup()
" deoplete.nvim }}}

" plugins }}}
" ----------------------------------------------------------------------------
