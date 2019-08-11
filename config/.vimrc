set guifont=Consolas:h14
set directory=/tmp

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'
    Plug 'w0rp/ale'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/lightline.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'groenewege/vim-less'
    Plug 'easymotion/vim-easymotion'
    Plug 'maximbaz/lightline-ale'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
    Plug 'metakirby5/codi.vim'
    Plug 'ruanyl/vim-fixmyjs'
    Plug 'cakebaker/scss-syntax.vim'
call plug#end()

" Git
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviors

" Show line numbers
set number relativenumber

" Don't wrap lines
" set nowrap
" set ma

" Enable yanking to the clipboard
set clipboard=unnamedplus " use the clipboards of vim and win

set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

" Do no show -- INSERT--
set noshowmode

" Split windows to right natively
set splitright

" Mapleader
let mapleader = " "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
let g:NERDCreateDefaultMappings = 0
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1
" Highlight search matches
set hlsearch

" Ignore node_modules with command-t
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

let g:ctrlp_custom_ignore = 'node_modules\|build'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

" Intellisense
" https://medium.com/vim-drops/javascript-autocompletion-on-vim-4fea7f6934e2
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Allow JSX in .js files
let g:jsx_ext_required=0

let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'css': ['eslint']
 \ }

set t_Co=256  " vim-monokai now only support 256 colours in terminal.

let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.component_function = {
\   'gitbranch': 'fugitive#head',
\ }

let g:lightline.active = {
\   'left': [[ 'mode', 'paste', 'gitbranch', 'readonly', 'filename', 'modified' ]],
\   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
\ }

let g:ale_set_quickfix = 1
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_set_highlights = 0
let g:netrw_winsize=30

set shortmess=at
set cmdheight=1
colorscheme sublimemonokai

set laststatus=2

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Nastaveni mezery za komentary
let NERDSpaceDelims=1

" Mapping
nmap <C-e> :NERDTreeFind<CR>
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"


nnoremap <C-F> :Ag<Space>

" Type `gd` to go to definition
nnoremap <silent> gd :ALEGoToDefinition<CR>
" Meta-click (command-click) to go to definition
nnoremap <M-LeftMouse> <LeftMouse>:ALEGoToDefinition<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
" Disable arrow key
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable new space with Enter
noremap <Enter> <NOP>

"Move lines with Alt + k,j
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" Add new line after
" TODO: zprovoznit Ctrl+Enter
nmap <NL><Enter> O<Esc>
nmap <Enter> o<Esc>

" Easy motion
nmap s <Plug>(easymotion-s2)
nmap <Leader>p <Plug>(Prettier)

" Copy relative path
noremap <silent> <F4> :let @+=expand("%")<CR>
