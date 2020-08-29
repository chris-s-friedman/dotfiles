set nocompatible
syntax on
filetype off
colorscheme default

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Add your plugins below this line
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'preservim/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
" All of your Plugins must be added before the following line

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

call vundle#end()
filetype plugin indent on

" Tabs are spaces 
set expandtab 
" Number of spaces per tab 
set tabstop=4 
" Search as soon as characters are entered 
set incsearch 
" Highlight search results 
set hlsearch


