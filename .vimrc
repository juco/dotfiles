" ___________________
"    Juco .vimrc
" ___________________

" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin list
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'              " File browser
Plugin 'jistr/vim-nerdtree-tabs'          " One NERDTree to rule them all
Plugin 'altercation/vim-colors-solarized' " Colours
Plugin 'bling/vim-airline'                " Sexy status bar
Plugin 'kien/ctrlp.vim'                   " Fuzzy searching
Plugin 'tacahiroy/ctrlp-funky'            " Fuzy method searching
Plugin 'scrooloose/nerdcommenter'         " Multi-line comments
Plugin 'vim-scripts/EasyGrep'             " Project search
Plugin 'scrooloose/syntastic'             " Syntax checking
Plugin 'tpope/vim-fugitive'               " Git wrapper
Plugin 'christoomey/vim-tmux-navigator'   " Pane navigation tmux/vim
Plugin 'rizzatti/dash.vim'                " Dashing
Plugin 'Valloric/YouCompleteMe'           " You Complete Me
Plugin 'SirVer/ultisnips'                 " Snippets
Plugin 'Shougo/vimproc.vim'               " Async tasks
Plugin 'Shougo/unite.vim'                 " Unite
Plugin 'tpope/vim-obsession'              " Vim sessions

" Language specific
Plugin 'tpope/vim-rails'                  " Rails FTW
Plugin 'kchmck/vim-coffee-script'         " Coffeescript
Plugin 'groenewege/vim-less'              " LESS
Plugin 'cakebaker/scss-syntax.vim'        " SCSS
Plugin 'derekwyatt/vim-scala'             " Scala
Plugin 'tabmerge'                         " Merging tabs to splits
Plugin 'godlygeek/tabular'                " Alignment
Plugin 'Valloric/MatchTagAlways'          " HTML Matching tags
Plugin 'skammer/vim-css-color'            " CSS colouring
Plugin 'airblade/vim-gitgutter'           " Git Gutter

call vundle#end()
filetype plugin indent on

" Colorscheme
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=dark
colorscheme solarized
syntax on
hi TabLineSel ctermfg=2 ctermbg=8
"colorscheme Tomorrow-Night

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

" ES6 javascript syntax highlighting
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" Leader keys
nnoremap <leader>p :CtrlPTag<cr>           " ctrl-p current word
nnoremap <leader>o :NERDTreeTabsToggle<cr> " NERDTree toggle
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
source ~/.vimutilsnips
source ~/.vimspaces
source ~/.vimsyntastic
source ~/.vimmatchtags
