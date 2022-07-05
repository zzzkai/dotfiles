" Plugins
call plug#begin()
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
call plug#end()

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
syntax on
set number
set relativenumber
set mouse=a
set nohlsearch
set encoding=utf-8

" Permanent undo
set undodir=~/.vimdid
set undofile

" Tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" Sane splits
set splitright
set splitbelow

" keep the buffer 3 lines from the end
set scrolloff=3

" Search
set incsearch
set ignorecase
set smartcase
set hls

" =============================================================================
" # Shortcuts
" =============================================================================
" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" =============================================================================
" # Theme settings
" =============================================================================
set background=dark
colorscheme PaperColor
