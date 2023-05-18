call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs' " autocomplete matching quotes and paren
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } " Sweet autocompletion.
" let g:ycm_autoclose_preview_window_after_completion=1 " get rid of YCM window after autocomplete is done
Plug 'ajh17/VimCompletesMe' " Sweet autocompletion.
Plug 'pangloss/vim-javascript' " javascript syntax and indentation
" Plug 'udalov/kotlin-vim' " kotlin syntax
let g:javascript_plugin_jsdoc = 1
Plug 'flazz/vim-colorschemes' " lots of colorschemes
set t_Co=256
set background=dark
" search for files with c-p
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Ignore gitignored files
" open with ctrl-P
nnoremap <c-p> :FZF<cr>
Plug 'tpope/vim-surround' " Makes it easy to modify matching brackets
Plug 'vim-airline/vim-airline' " cool status bar
set laststatus=2 " airline status bar always on
Plug 'tpope/vim-commentary' " Allow quick commenting of lines
Plug 'tpope/vim-repeat' " integrates . command with plugin commands
Plug 'airblade/vim-gitgutter' " Vim git gutter
Plug 'justinmk/vim-sneak' " This looks useful for when I actually become good at using vim.
let g:sneak#label = 1
" Plug 'whatyouhide/vim-lengthmatters' " highlight lines that are too long
" let g:lengthmatters_excluded = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'help', 'qf', 'dirvish', 'markdown']
" Plug 'w0rp/ale' " Async linting
let g:ale_linters = {'javascript': ['eslint']}
Plug 'Yggdroot/indentLine' " vertical bars with indents
let g:vim_json_conceal=0
Plug 'vim-scripts/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0
call plug#end()

" Non-plugin configuration
colorscheme gruvbox
set incsearch " start search as you type
set hlsearch " highlight search results
" switch ; and : in normal mode
nnoremap ; :
nnoremap : ;
" find again with ,
nnoremap , ;
" always go visually down and up even with wrapped lines
nnoremap j gj
nnoremap k gk
inoremap jk <Esc>

nnoremap J }
nnoremap K {
xnoremap J }
xnoremap K {
nnoremap H ^
nnoremap L $
xnoremap H ^
xnoremap L $

nnoremap M J
" paste but match indent (not working for some reason)
" nnoremap p ]p
" move to last unmatched (
nnoremap [b [(
nnoremap ]b ])
map <Enter> o<ESC>k
" delete into blackhole register when pasting over visual selection
xnoremap p "_dP
" stamp over current word with yanked text
nnoremap P "_diwP
" split comma-separated values inside the parentheses into separate lines
nnoremap s, vi(ovi<CR><Esc>vi(va, <Esc>V:s/, /,\r/g<CR>va(=j^:noh<CR>
" yank until end of line
nnoremap Y y$
" map 9 to ( as a text object (doesn't work in ideavim)
xnoremap i9 :<C-u>normal! T(vt)<CR>
onoremap i9 :normal! vi(<CR>
" bunch of random text objects
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '-', '#' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor
" simplify n. when changing selection
nnoremap > n.

set splitright " open new vsplit files on the right
set splitbelow " open new hsplit files on the bottom
syntax on
set expandtab
set softtabstop=4
set shiftwidth=4
autocmd Filetype javascript setlocal softtabstop=4 shiftwidth=4 tw=100 expandtab
autocmd Filetype java setlocal softtabstop=4 shiftwidth=4 tw=120 expandtab
autocmd FileType python setlocal softtabstop=4 shiftwidth=4 tw=100 expandtab

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

" Ignore case when searching
set ignorecase
set smartcase

