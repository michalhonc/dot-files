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
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'sheerun/vim-polyglot'
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    Plug 'w0rp/ale'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/lightline.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    Plug 'maximbaz/lightline-ale'
    Plug 'ruanyl/vim-fixmyjs'
    "Plug 'erichdongubler/vim-sublime-monokai'
    "Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
call plug#end()

" https://github.com/MaxMEllon/vim-jsx-pretty#%EF%B8%8F-work-with-vim-polyglot 
"let g:polyglot_disabled = ['tsx']
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

"" NERDTree
" Automaticaly open NERDTree
"autocmd VimEnter * NERDTree
" Close NERDTree when open file
let NERDTreeQuitOnOpen = 1
" Delete buffer when deleting file
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Close NERDTree if is only tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

let g:NERDCreateDefaultMappings = 0
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1
nmap <C-e> :NERDTreeFind<CR>


"" NERDCommenter
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" Mapping
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv


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

" Split windows to right and below natively
set splitright
set splitbelow

" Mapleader
let mapleader = " "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
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

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['tslint'],
\}
let g:ale_set_quickfix = 1
let g:ale_sign_warning = '>'
let g:netrw_winsize=30
" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 0

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
" Mapping
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
" Disable arrow key
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable new space with Enter
noremap <Enter> <NOP>

" Add new line after
" TODO: zprovoznit Ctrl+Enter
nmap <NL><Enter> O<Esc>
nmap <Enter> o<Esc>

" Easy motion
nmap s <Plug>(easymotion-s2)

" Copy relative path
noremap <silent> <F4> :let @+=expand("%")<CR>
