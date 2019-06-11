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
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/lightline.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'groenewege/vim-less'
    Plug 'easymotion/vim-easymotion'
    Plug 'maximbaz/lightline-ale'
call plug#end()

" Git
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviors

" Show line numbers
set number relativenumber

" Don't wrap lines
set nowrap

" Enable yanking to the clipboard
set clipboard=unnamed

" Do no show -- INSERT--
set noshowmode

" Split windows to right natively
set splitright
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
let g:NERDCreateDefaultMappings = 0
" Highlight search matches
set hlsearch

" Ignore node_modules with command-t
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

let g:ctrlp_custom_ignore = 'node_modules\|build'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

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
let g:netrw_winsize=30

set shortmess=at
set cmdheight=2
colorscheme vim-monokai-tasty

set laststatus=2
set shiftwidth=4
set autoindent
set smartindent

" Mapping
nmap <C-e> :NERDTreeToggle<CR>
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"


nnoremap <S-F> :Rg<Cr>

" Type `gd` to go to definition
nnoremap <silent> gd :ALEGoToDefinition<CR>
" Meta-click (command-click) to go to definition
nnoremap <M-LeftMouse> <LeftMouse>:ALEGoToDefinition<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" Disable arrow key
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable new space with Enter
noremap <Enter> <NOP>

" Move lines with Alt + k,j
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Add new line after
nmap <S-k> O<Esc>
nmap <S-j> o<Esc>

" Easy motion
nmap s <Plug>(easymotion-s) 
