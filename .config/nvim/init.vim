" ___________________
"    Juco .vimrc
" ___________________

" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

" Plugin list
Plug 'scrooloose/nerdtree'                  " File browser
Plug 'jistr/vim-nerdtree-tabs'              " One NERDTree to rule them all
Plug 'bling/vim-airline'                    " Sexy status bar
Plug 'vim-airline/vim-airline-themes'     " Airline themese
Plug 'scrooloose/nerdcommenter'             " Multi-line comments
Plug 'scrooloose/syntastic'                 " Syntax checking
Plug 'tpope/vim-fugitive'                   " Git wrapper
Plug 'christoomey/vim-tmux-navigator'       " Pane navigation tmux/vim
Plug 'rizzatti/dash.vim'                    " Dashing
Plug 'Valloric/YouCompleteMe'               " You Complete Me
Plug 'Shougo/vimproc.vim'                   " Async tasks
Plug 'Shougo/unite.vim'                     " Unite
Plug 'morhetz/gruvbox'                      " colorscheme

" Language specific
Plug 'tpope/vim-rails'                      " Rails FTW
Plug 'kchmck/vim-coffee-script'             " Coffeescript
Plug 'groenewege/vim-less'                  " LESS
Plug 'cakebaker/scss-syntax.vim'            " SCSS
Plug 'derekwyatt/vim-scala'                 " Scala
Plug 'tabmerge'                             " Merging tabs to splits
Plug 'godlygeek/tabular'                    " Alignment
Plug 'Valloric/MatchTagAlways'              " HTML Matching tags
Plug 'airblade/vim-gitgutter'               " Git Gutter
Plug 'jelera/vim-javascript-syntax'         " Javascript syntax
Plug 'mtscout6/syntastic-local-eslint.vim'  " Use local eslint

"call vundle#end()
call plug#end()
filetype plugin indent on

" Colorscheme
"let g:solarized_termtrans = 1
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
set background=dark
"colorscheme Tomorrow-Night
"colorscheme solarized
colorscheme gruvbox
syntax on
hi TabLineSel ctermfg=black ctermbg=191
let g:airline_theme='wombat'

" Tabs
set expandtab
set tabstop=2
set shiftwidth=2

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
"highlight ColorColumn ctermbg=LightGrey

" System clipboard
set clipboard=unnamed

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

" ES6 javascript syntax highlighting
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" Leader keys
nnoremap <leader>p :CtrlPTag<cr>           " ctrl-p current word
nnoremap <leader>, :NERDTreeTabsToggle<cr> " NERDTree toggle
nnoremap <leader>h :noh<cr>                " Cancel highlight
nnoremap <leader>fu :CtrlPFunky<cr>        " Funky method search

:nmap <silent> <leader>d <Plug>DashSearch  " Dashing current word

" reload all buffers
function ReloadAllBuffers()
  set noconfirm
  bufdo e!
  set confirm
endfunction
nmap <leader>gr call ReloadAllBuffers()

source ~/.vimunite
source ~/.vimtmux
source ~/.vimspaces
source ~/.vimsyntastic
source ~/.vimmatchtags
