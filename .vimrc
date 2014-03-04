colorscheme desert
if has("win32")||has("win64")||has("win32unix")
    set guifont=ゆたぽん（コーディング）:h14
endif

set backspace=indent,eol,start

" WildMenu
set wildmenu

" mapping
map <C-A> ggVG
map <C-X> "+x
map <C-C> "+y
map <C-V> "+gP
map <C-S> :w
map <C-F> :brows confirm e
vnoremap y "+y


"----------------------------------------------------
" backup
"----------------------------------------------------
" don't backup
set nobackup
" create backup before save
set writebackup

"----------------------------------------------------
" search
"----------------------------------------------------
" remain searching history until 100
set history=100
" when search, tell capital
set smartcase
" search to end and return start
set wrapscan
" don't use incremental search
set noincsearch

"----------------------------------------------------
" view
"----------------------------------------------------
" show title
set title
" show line number
set number
" show ruler
set ruler
" show tab '>---' and end of line '$'
set list
set listchars=tab:>-,trail:-
" display incomplete commands
set showcmd
" always show status line
set laststatus=2
" display opposite parentheses
set showmatch
" set time which display opposite parentheses
set matchtime=2
" valid syntax highlight
syntax on
" valid highlight searching word
set hlsearch
" change comment color
highlight Comment ctermfg=DarkCyan
" command line supplement -> advanced
set wildmenu
" height command line area
set cmdheight=2
" don't show message when start up
set shortmess+=I

" limit one line length
set textwidth=80
" too long line is folded and showed in next line
set wrap
" highlight too long line
set colorcolumn=80
" show lastline
set display=lastline
" fold by indent
setl foldmethod=indent
" fold more than 99 level
setl foldlevel=99

" color of statusline
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

"----------------------------------------------------
" indent
"----------------------------------------------------
" valid auto indent
set autoindent
" valid high-tech auto indent
set smartindent
" valid customizable auto indent
set cindent
" tab to num of blank
set tabstop=4
" tab to num of blank when edit
set softtabstop=4
" indent wide(num of blank)
set shiftwidth=4
" when press tab, input by blank
set expandtab
" in top of line, press tab and indent num of 'shiftwidth'
set smarttab

"----------------------------------------------------
" auto command
"----------------------------------------------------
if has("win32")||has("win64")||has("win32unix")
    if has("autocmd")
        " valid plugin and indent by filetype
        filetype plugin indent on
        " memory where cursor is
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
    endif
endif
"----------------------------------------------------
" word encoding
"----------------------------------------------------
" terminal encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" valid encoding
set fileencodings=iso-2022-jp,cp932,euc-jp,utf-8
" auto recognize encoding
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " check iconv in eucJP-ms
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
    " check iconv in JISX0213
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " build fileencodings
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    " remove constant
    unlet s:enc_euc
    unlet s:enc_jis
endif
" if japanese isn't included, use encoding
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" auto recognize return type
set fileformats=unix,dos,mac
" fix when irregular word
if exists('&ambiwidth')
    set ambiwidth=double
endif

"----------------------------------------------------
" other
"----------------------------------------------------
" synch clipbord
set clipboard=unnamed
" off vi interchange
set nocompatible
" don't save and show other file
set hidden
" don't stop cursor
set whichwrap=b,s,h,l,<,>,[,]

" vundle
set rtp+=~/.vim/vundle.git/
filetype off
call vundle#rc()
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'sontek/rope-vim'
Bundle 'lambdalisue/vim-django-support'
filetype plugin indent on
