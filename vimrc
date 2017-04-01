" Begin Vundle configuration

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Put all your Vundle plugins here. All of these are hosted on github
Plugin 'Auto-Pairs' " autocomplete matching quotes and paren
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe' " Sweet autocompletion
Plugin 'pangloss/vim-javascript' " javascript syntax and indentation
Plugin 'scrooloose/syntastic' " support for all kinds of linters
Plugin 'KevinGoodsell/vim-csexact' " allows colorschemes to appear accurately in a terminal
Plugin 'flazz/vim-colorschemes' " lots of colorschemes
Plugin 'wincent/command-t' " allows you to quickly open files
Plugin 'tpope/vim-surround' " Makes it easy to modify matching brackets
Plugin 'vim-airline/vim-airline' " cool status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'takac/vim-hardtime' " forcing myself to actually learn to use vim
set laststatus=2 " airline status bar always on
Plugin 'scrooloose/nerdcommenter' "Allow quick commenting of lines
Plugin 'airblade/vim-gitgutter' " Vim git gutter
call vundle#end()            " required
filetype plugin indent on    " required

" End Vundle configuration
" This is all of my customization

" Some javascript linting stuff. Requires eslint_d is installed.
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
colorscheme wombat
set completeopt-=preview " disable annoying preview window YouCompleteMe opens all the time
set nu " turn on line numbers by default
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 " set javascript to 2 spaces
