" not vi compatible
set nocompatible

" Disable the default Vim startup message.
set shortmess+=I

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
colorscheme PaperColor
set background=dark
set showmatch " show matching braces when text indicator is over them
syntax enable

"------------------
" Status line
"------------------
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

let b:BranchName = ' '
function! UpdateStatuslineGit()
  let l:branchname = GitBranch()
  let b:BranchName = strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

augroup UPDATE_BRANCH
	autocmd!
	autocmd BufWritePre * :call UpdateStatuslineGit()
	autocmd BufReadPost * :call UpdateStatuslineGit()
	autocmd BufEnter * :call UpdateStatuslineGit()
augroup END

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{b:BranchName}
set statusline+=%#CursorLineNr#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
"---------------------
" Basic editing config
"---------------------
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support.
set mouse+=a

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
set tabstop=2
set shiftwidth=2
set softtabstop=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> 
" 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Set auto indentation
set autoindent

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" jump to the end
autocmd BufNewFile * normal G

set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
