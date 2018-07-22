call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs' " autocomplete matching quotes and paren
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } " Sweet autocompletion.
let g:ycm_autoclose_preview_window_after_completion=1 " get rid of YCM window after autocomplete is done
Plug 'pangloss/vim-javascript' " javascript syntax and indentation
let g:javascript_plugin_jsdoc = 1
Plug 'flazz/vim-colorschemes' " lots of colorschemes
set t_Co=256
set background=dark
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " search for files with c-p
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Ignore gitignored files
nnoremap <c-p> :FZF<cr> " open with ctrl-P
Plug 'tpope/vim-surround' " Makes it easy to modify matching brackets
Plug 'vim-airline/vim-airline' " cool status bar
set laststatus=2 " airline status bar always on
Plug 'tpope/vim-commentary' " Allow quick commenting of lines
Plug 'tpope/vim-repeat' " integrates . command with plugin commands
Plug 'airblade/vim-gitgutter' " Vim git gutter
Plug 'justinmk/vim-sneak' " This looks useful for when I actually become good at using vim.
let g:sneak#label = 1
Plug 'airblade/vim-rooter' " changes working dir to project root
Plug 'whatyouhide/vim-lengthmatters' " highlight lines that are too long
let g:lengthmatters_excluded = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'help', 'qf', 'dirvish', 'markdown']
Plug 'w0rp/ale' " Async linting
let g:ale_linters = {'javascript': ['eslint']}
Plug 'Yggdroot/indentLine' " vertical bars with indents
Plug 'vim-scripts/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup
call plug#end()

" Non-plugin configuration
colorscheme gruvbox
set incsearch " start search as you type
set hlsearch " highlight search results
" switch ; and : in normal mode
noremap ; :
noremap : ;
" always go visually down and up even with wrapped lines
nnoremap j gj
nnoremap k gk
inoremap jk <Esc>

" Remap F5 to bring up a list of buffers, and allow user to then enter a
" number and switch to it
nnoremap <F5> :buffers<CR>:buffer<Space>
set splitright " open new vsplit files on the right
set splitbelow " open new hsplit files on the bottom
syntax on
autocmd Filetype javascript setlocal softtabstop=2 shiftwidth=2 tw=100 expandtab
autocmd Filetype java setlocal softtabstop=4 shiftwidth=4 tw=120 expandtab omnifunc=javacomplete#Complete
autocmd FileType python setlocal tw=79
let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', '.idea/'] " Adding intellij base directories to vim rooter

autocmd FocusLost * set norelativenumber
autocmd FocusGained * set relativenumber

autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

" Toggle relative line numbers using <C-n>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    " set number
  else
    " set nonumber
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


set relativenumber
set nu
set numberwidth=2

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
