" ~/.vimrc ---> dgn-home version 

syntax enable

set number
set relativenumber
set history=1000
set shell=$SHELL
set showcmd
set showmode
set backspace=indent,eol,start
set visualbell
set autoread
set hidden
set autoindent
set smartindent
set shiftwidth=2
set sidescroll=0
set tabstop=2
set expandtab
set nowrap
set linebreak
set foldmethod=manual
set foldenable
set encoding=utf-8
set laststatus=2
set ruler
syntax on
filetype plugin on
filetype indent on
let mapleader=","

call plug#begin('~/.nvim/plugged')

Plug 'lervag/vimtex'
Plug 'bling/vim-airline' 
Plug 'bling/vim-bufferline'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'scrooloose/syntastic'
Plug 'sjl/badwolf'
Plug 'samsonw/vim-task'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-markdown'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'powerline/powerline'
Plug 'stephenmckinney/vim-solarized-powerline'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'xolox/vim-misc'  | Plug 'xolox/vim-notes'
Plug 'tommcdo/vim-exchange'
Plug 'Chiel92/vim-autoformat'
Plug 'benekastah/neomake'
Plug 'reedes/vim-lexical'
Plug 'jdonaldson/writeGooder'
Plug 'aperezdc/vim-template'
Plug 'vim-scripts/vim-webdevicons'
Plug 'junegunn/vim-journal'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'joom/latex-unicoder.vim'
Plug 'farseer90718/vim-taskwarrior'
Plug 'vim-scripts/vimwiki'
Plug 'chrisbra/unicode.vim'
Plug 'flazz/vim-colorschemes'
Plug 'hsitz/VimOrganizer'
Plug 'jceb/vim-orgmode'
Plug 'jmcantrell/vim-virtualenv'
Plug 'chrisbra/NrrwRgn'
Plug 'vim-scripts/vim-webdevicons'

call plug#end()

" Put vim specific settings below.

set thesaurus+=~/.vim/spell/mthesaur.txt
source $HOME/nvimsource.vim 
source $HOME/dgn-vimtex.vim
let g:python_host_prog = '/usr/local/bin/python3.4'

