" References:
" http://amix.dk/vim/vimrc.html
" http://nvie.com/posts/how-i-boosted-my-vim/

syntax on
filetype plugin indent on
" pathogen
execute pathogen#infect()

" Tabs
set expandtab
set tabstop=2
set shiftwidth=2

" Some crucial settings
set number     " show line numbers
set nowrap
set showmatch  " show matching parenthesis
set smartcase  " search case-insensitive if everything is lower case
set hlsearch   " highlight search terms
set incsearch  " highlight search terms as you type
set title      " set the terminal title
set laststatus=2 " display the status bar (filename)
set nobackup   " don't create annoying backup files
set noswapfile " or swap files
" Set to auto read when a file is changed from the outside
set autoread
" Use spaces instead of tabs
set expandtab

" tab colors
hi TabLine ctermfg=11 ctermbg=Blue
hi TabLineSel ctermfg=11 ctermbg=Green

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
   %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

" trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ruler
set colorcolumn=85
highlight ColorColumn ctermbg=LightBlue
