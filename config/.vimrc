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
  Plug 'elzr/vim-json'
  Plug 'jparise/vim-graphql'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviors

set directory=~/.vim/tmp

" Show line numbers
set number

" Don't wrap lines
set nowrap

" Enable yanking to the clipboard
set clipboard=unnamed

set directory=~/.vim-swap/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching

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
 \ 'javascript': ['eslint']
 \ }

set t_Co=256  " vim-monokai now only support 256 colours in terminal.

map <F5> :wall!<CR>:!sbcl --load foo.cl<CR><CR>
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:netrw_winsize=30

set shortmess=at
set cmdheight=2
colorscheme vim-monokai-tasty

set shiftwidth=4
set autoindent
set smartindent
