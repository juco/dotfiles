" ___________________
"    Juco .vimrc
" ___________________

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Plugin list
Plug 'scrooloose/nerdtree'                  " File browser
Plug 'jistr/vim-nerdtree-tabs'              " One NERDTree to rule them all
Plug 'vim-airline/vim-airline'              " Sexy status bar
Plug 'vim-airline/vim-airline-themes'       " Airline themese
Plug 'scrooloose/nerdcommenter'             " Multi-line comments
Plug 'scrooloose/syntastic'                 " Syntax checking
Plug 'tpope/vim-fugitive'                   " Git wrapper
Plug 'christoomey/vim-tmux-navigator'       " Pane navigation tmux/vim
Plug 'rizzatti/dash.vim'                    " Dashing
"Plug 'Valloric/YouCompleteMe'               " You Complete Me
Plug 'vim-airline'                          " status bar
Plug 'airblade/vim-gitgutter'               " Git Gutter
Plug 'Yggdroot/indentLine'                  " Lines showing indents

" Shougo <3
Plug 'Shougo/vimproc.vim'                   " Async tasks
Plug 'Shougo/unite.vim'                     " Unite
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Plug 'ryanoasis/vim-devicons'               " icon fonts

" Colours
Plug 'mhartington/oceanic-next'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'

" -Language specific-
Plug 'vim-ruby/vim-ruby'                    " Some ruby sexyness
Plug 'tpope/vim-rails'                      " Rails FTW
Plug 'tpope/vim-endwise'                    " Matching end's
Plug 'kchmck/vim-coffee-script'             " Coffeescript
Plug 'groenewege/vim-less'                  " LESS
Plug 'cakebaker/scss-syntax.vim'            " SCSS
Plug 'derekwyatt/vim-scala'                 " Scala
Plug 'godlygeek/tabular'                    " Alignment
Plug 'Valloric/MatchTagAlways'              " HTML Matching tags
Plug 'pangloss/vim-javascript'              " JS syntax etc.
Plug 'mxw/vim-jsx'                          " JSX
Plug 'mtscout6/syntastic-local-eslint.vim'  " Use local eslint
Plug 'sunaku/vim-ruby-minitest'             " Minitest omnicomplete

call plug#end()

filetype plugin indent on

" Colour scheme - oh so indecisive
syntax enable

" Old
"colorscheme Tomorrow-Night
"colorscheme solarized
"colorscheme gruvbox   <-
":let g:airline_theme='wombat'

" Current
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

call deoplete#enable()

" Tabs
set expandtab
set tabstop=2
set shiftwidth=2

" System clipboard
set clipboard=unnamed

" Crappy macOS Sierra copy/paste hack
set clipboard=unnamed

" Some more crucial settings
set number       " show line numbers
set nowrap
set showmatch    " show matching parenthesis
set smartcase    " search case-insensitive if everything is lower case
set hlsearch     " highlight search terms
set incsearch    " highlight search terms as you type
set title        " set the terminal title
set laststatus=2 " display the status bar (filename)
set nobackup     " don't create annoying backup files
set noswapfile   " or swap files
set expandtab    " use spaces instead of tabs
set ai           " auto indent
set si           " smart indent
set wrap         " wrap lines
set autoread     " auto reload files when externally changed
set mouse=nicr   " mouse scroll

" ruler
set colorcolumn=80

" Remap the leader key
let mapleader=","

" Rebind escape
imap jj <Esc>

" Centre the window on space & search
map <space> zz
map n nzz
map N Nzz

" For those typos
cmap W w
cmap WQ wq
cmap Wq wq

" Icon fonts
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h11

" JS library syntax highlighting
let g:used_javascript_libs = 'underscore,angularjs,react'

" vim-airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" ES6 javascript syntax highlighting
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" JSX plugin for .js files
let g:jsx_ext_required = 0

" Enable the matchit macro
runtime macros/matchit.vim

" Leader keys
nnoremap <leader>p :CtrlPTag<cr>           " ctrl-p current word
nnoremap <leader>, :NERDTreeTabsToggle<cr> " NERDTree toggle
nnoremap <leader>h :noh<cr>                " Cancel highlight
nnoremap <leader>fu :CtrlPFunky<cr>        " Funky method search

" Beginning / End of line
noremap H ^
noremap L $

:nmap <silent> <leader>d <Plug>DashSearch  " Dashing current word

" reload all buffers
function ReloadAllBuffers()
  set noconfirm
  bufdo e!
  set confirm
endfunction
nmap <leader>gr call ReloadAllBuffers()

" Complete minitest - C-X C-U
set completefunc=syntaxcomplete#Complete

source ~/.vimunite
source ~/.vimtmux
source ~/.vimspaces
source ~/.vimsyntastic
source ~/.vimmatchtags
