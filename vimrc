" not vi compatible
set nocompatible

" Disable the default Vim startup message.
set shortmess+=I

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

"---------------------
" Basic editing config
"---------------------

" Show line numbers.
set number

" set relative number of lines.
set relativenumber

" highlight search
set hls

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" line break
set lbr

" keep the buffer 3 lines from the end
set scrolloff=3

" use 4 spaces instead of tabs during formatting
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Set auto indentation
set autoindent

" movement relative to display lines
nnoremap <silent> <Leader>d :call ToggleMovementByDisplayLines()<CR>
function SetMovementByDisplayLines()
    noremap <buffer> <silent> <expr> k v:count ? 'k' : 'gk'
    noremap <buffer> <silent> <expr> j v:count ? 'j' : 'gj'
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$
endfunction
function ToggleMovementByDisplayLines()
    if !exists('b:movement_by_display_lines')
        let b:movement_by_display_lines = 0
    endif
    if b:movement_by_display_lines
        let b:movement_by_display_lines = 0
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> $
    else
        let b:movement_by_display_lines = 1
        call SetMovementByDisplayLines()
    endif
endfunction

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>


"-------------------------
" File header
"-------------------------
"for .c,.h,.sh,.java
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
 
func SetTitle() 
	".sh file 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: Kai")
		call append(line(".")+2, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+3, " ************************************************************************/") 
		call append(line(".")+4, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+5, "#include <iostream>")
		call append(line(".")+6, "using namespace std;")
		call append(line(".")+7, "")
	endif
	if &filetype == 'c'
		call append(line(".")+5, "#include <stdio.h>")
		call append(line(".")+6, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+5, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+6, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+5,"public class ".expand("%:r"))
		call append(line(".")+6,"")
	endif
endfunc
" jump to the end
autocmd BufNewFile * normal G
