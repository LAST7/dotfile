set nocompatible
set t_Co=256

set encoding=utf-8
syntax on

set number
set relativenumber
set ruler
set showmatch

set cursorline

set showmode
set showcmd

set mouse=a

filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set textwidth=80
set wrap
set linebreak

set scrolloff=8

set hlsearch
set ignorecase
set smartcase

set autochdir

set noerrorbells

set autoread

set listchars=tab:>~,space:·,trail:■

set wildmenu

imap jj <Esc>

nmap H ^
vmap H ^
nmap L $
vmap L $

nmap <C-u> 8k
vmap <C-u> 8k
nmap <C-d> 8j
vmap <C-d> 8j

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
