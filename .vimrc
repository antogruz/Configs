"Vundle and plugins {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Plugin 'thiagoalessio/rainbow_levels.vim'
Plugin 'tpope/vim-surround'
filetype plugin indent on
" }}}

" General {{{
set history=700 " Sets how many lines of history VIM has to remember
set number " Show lines numbers
set autoread " Set to auto read when a file is changed from the outside

let mapleader = ","
let maplocalleader = "\""

" Fast saving
inoremap <leader>w <Esc>:wall<cr>
nnoremap <leader>w :wall<cr>

set clipboard=unnamed

set foldmethod=indent

" highlight 80 columns
set colorcolumn=80


" }}}

" Vim user interface {{{
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

set tildeop

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
set showcmd
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" All folds are closed on start
set foldlevelstart=0
" }}}

" Gui and encoding {{{
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

autocmd BufEnter * :syntax sync fromstart
" }}}

" Files, backup, undo {{{

" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowb
set noswapfile

"}}}

"Text, tab and indent related {{{
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"}}}

" Visual mode search {{{
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" }}}

" Moving around, tabs, windows and buffers {{{

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Remap VIM 0 to first non-blank character
noremap 0 ^

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" }}}

" Don't close window, when deleting a buffer {{{
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" }}}

" ctags shortcuts {{{
nnoremap <C-s> <C-]>
nnoremap <C-g> g]
nnoremap <C-t> <C-T>
nnoremap <C-d> <C-W>}
nnoremap <C-z> <C-W>kZZ
" }}}

" edit and source vimrc {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" bash like completion {{{
set wildmenu
set wildmode=list:longest
inoremap <C-f> <C-x><C-f>
"}}}

" cosmetics and solarized theme {{{

syntax enable
set background=light
colorscheme solarized
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
call togglebg#map("<F5>")

let g:solarized_termcolors=16

let b:findCount=0

"set guifont=Droid\ Sans\ Mono\ 11
"set guifont=Noto\ Mono\ Regular\ 11
"set guifont=MonacoB2:h15
set guifont=Monaco:h13
call togglebg#map("<F5>")

"Coloration based on indentation
"au Filetype xml :RainbowLevelsOn

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

""" }}}

" Trailing spaces {{{
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"Remove all trailing whitespace
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" }}}

" F1 - F12 commands {{{
noremap <F6> :source ~/.vim/parametersHighlight.vim<CR>
noremap <F3> :source ~/.vim/highlight.vim<CR>
noremap <F4> *:execute '!grep -n --exclude-dir=".git" --exclude-dir=".idea" --exclude-dir="target" --exclude="*~" --exclude=tags --exclude="*class" --exclude="*.txt" -I -R -w ' . expand("<cword>") . ' . '<CR>
noremap <c-i> *N:execute '!grep -n --exclude-dir=".git" --exclude-dir=".idea" --exclude-dir="target" --exclude="*~" --exclude=tags --exclude="*class" --exclude="*.txt" -I -R -w "implements ' . expand("<cword>") . '" . '<CR>
noremap <c-e> *N:execute '!grep -n --exclude-dir=".git" --exclude-dir=".idea" --exclude-dir="target" --exclude="*~" --exclude=tags --exclude="*class" --exclude="*.txt" -I -R -w "throw new ' . expand("<cword>") . '" . '<CR>
noremap <c-b> *N:execute '!grep -n --exclude-dir=".git" --exclude-dir=".idea" --exclude-dir="target" --exclude="*~" --exclude=tags --exclude="*class" --exclude="*.txt" -I -R -w "new ' . expand("<cword>") . '" . '<CR>
noremap <F2> :! bash `ls check*` <CR>
nnoremap <CR> :!
noremap <leader>j :!./%<CR>
" }}}

" fvim in vim {{{
command! -nargs=1 Fe call FindEdit(<f-args>)

function! FindEdit(name)
    let files = split(system("findsource " . a:name))
    for f in files
        execute "tabe " . f
    endfor
endfunction
" }}}

" Informations on syntax {{{
" a little more informative version of the above
nnoremap <Leader>si :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}

" Adds thanks to «learn Vimscript the hard way» {{{

noremap - ddp
noremap _ ddkP
inoremap   _

" Uppercases
inoremap <leader>u <esc>viwU<esc>ea
nnoremap <leader>u viwU<esc>

" Autocomplete
inoremap <leader>n <c-n>
inoremap <tab> <c-n>

" Abbreviations
iabbrev @@ agruzelle@salesforce.com
iabbrev swdf SfdcWordDelimiterFilter
iabbrev ic incrementToken()
iabbrev pbc public class
iabbrev retrun return
iabbrev retrnu return

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>f"
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>f'
vnoremap <leader>" <esc>a"<esc>`<i"<esc>f"

nnoremap H 0
nnoremap L $

inoremap <Esc> STOPHITTINGTHATTOUCHAAAAAAAAAAAAAAAAAAAA
inoremap <Delete> NOTAUTHORIZED

inoremap ,c <Esc>
inoremap jk <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

"don't use array keys
noremap <left> <nop>
nnoremap <up> <C-w>=
noremap <right> <nop>
noremap <down> <nop>
nnoremap K i<cr><Esc>
nnoremap sn F,dt,f,P
nnoremap sp F,dt,F,P

augroup comments
    autocmd!
    autocmd FileType javascript,java,c,cpp nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python,bash,sh nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
augroup END

augroup abbrevs
    autocmd!
    autocmd FileType bash,sh iabbrev bang #!/bin/bash
    autocmd FileType python iabbrev bang #!/usr/bin/env python3
    autocmd FileType bash,sh iabbrev fun function
    autocmd FileType bash,sh iabbrev scriptdir scriptDir=`dirname "$0"`
    autocmd Filetype java iabbrev print System.out.println
    autocmd BufNewFile *.sh w
    autocmd BufNewFile *.sh :!chmod +x %
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

onoremap p i(
onoremap np :<c-u>normal! f(vi(<cr>
onoremap lp :<c-u>normal! F)vi(<cr>
onoremap on( :<c-u>normal! f(vf)<cr>
onoremap ol( :<c-u>normal! F)vF(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap on{ :<c-u>normal! f{vf}<cr>
onoremap ol{ :<c-u>normal! F}vF{<cr>

augroup inside_heading
    autocmd!
    autocmd Filetype markdown onoremap ih :<c-u>execute "normal! ?^==\\+\\\|^--\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd Filetype markdown onoremap oh :<c-u>execute "normal! ?^==\\+\\\|^--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

onoremap i@ :<c-u>execute "normal! /\\h\\+@\\h\\+\r:nohlsearch\rvE"<cr>

nnoremap < <<
nnoremap > >>

" Always show the status line
set laststatus=2

set statusline=%F "Filename full path
set statusline+=%m "Modified ?
set statusline+=%= "Switch to rightside
set statusline+=%l/%L "lines
"set statusline+=%y "Filetype
"
" TODO : use variable for javastatusline to reuse statusline
augroup statuslines
    autocmd!
    autocmd Filetype java setlocal statusline=%t%m%=%l/%L
augroup END

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
augroup END
" }}}

" }}}

" Use make with maven compile {{{
set errorformat=[ERROR]\ %f:[%l\\,%v]\ %m,%-G%.%#
set makeprg=mvn\ compile

" }}}
nnoremap <leader>b :execute "rightbelow vsplit" bufname("#")<cr>

iabbrev importlist import java.util.List

"nnoremap <leader>g :silent :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 10<cr>
nnoremap <leader>m :silent make<cr>:copen 10<cr>
nnoremap « :cprevious<cr>
nnoremap » :cnext<cr>


set tabpagemax=100

