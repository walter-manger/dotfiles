
set nocompatible

" before load goes here

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
" set gcr=a:blinkon0
set visualbell
set autoread

set nobackup
set nowritebackup
set noswapfile
" set cursorline
set autochdir

" Spaces instead of tabs, default to 2
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
" set hidden

syntax on
let mapleader=","
" Plugins

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

syntax enable
set background=dark
"let g:solarized_termcolors = 256
colorscheme atom-dark-256 


" NERDTree
map <C-n> :NERDTreeToggle<CR>

" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jscs']
let g:syntastic_javascript_jscs_args = "--esprima=esprima-fb" 
let g:syntastic_scss_checkers = [] 

" change shape of cursor in insert mode in iTerm 2
let s:iterm   = exists('$ITERM_PROFILE') || exists('$ITERM_SESSION_ID') || filereadable(expand("~/.vim/.assume-iterm"))
let s:tmux    = exists('$TMUX')

if s:iterm
  let start_insert  = "\<Esc>]50;CursorShape=1\x7"
  let end_insert    = "\<Esc>]50;CursorShape=0\x7"

  if s:tmux
   " let start_insert  = s:TmuxWrap(start_insert)
   " let end_insert    = s:TmuxWrap(end_insert)
  endif

  let &t_SI = start_insert
  let &t_EI = end_insert
 endif


" key mappings for switching between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H> 
set splitbelow
set splitright

