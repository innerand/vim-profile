"- ======================
"  VUNDLE CONFIGURATION
" ======================

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'bling/vim-bufferline'
"Plugin 'vim-scripts/CycleColor'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'lervag/vimtex'
Plugin 'altercation/vim-colors-solarized'
"Rust
"Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
"Plugin 'KabbAmine/zeavim.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'jremmen/vim-ripgrep'
Plugin 'dyng/ctrlsf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" \vundle configuration


let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_position = 'bottom'


" =====================================
"  AIRLINE (Status line) Configuration
" =====================================
"
" Always display status line
set laststatus=2

if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
"let g:airline_left_sep = '▶'
let g:airline_right_sep = ''
"let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr =''
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'c'  : 'C',
      \ 'i'  : 'I',
      \ 'ic' : 'I',
      \ 'ix' : 'I',
      \ 'n'  : 'N',
      \ 'ni' : 'N',
      \ 'no' : 'N',
      \ 'R'  : 'R',
      \ 'Rv' : 'R',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ 't'  : 'T',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ }

" Command line color scheme
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#nerdtree#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#format = 1
let g:airline#extensions#branch#displayed_head_limit = 14

let g:bufferline_echo = 0 " Don't show buffers in commandline

" =============
"  Colorscheme
" =============

syntax enable
if has('gui_running')
   set guifont=DejaVu\ Sans\ Mono\ 12
   set background=light
   colorscheme solarized
else
   set background=dark
   colorscheme solarized
   " Fix broken backgroundcolor
   if &term =~ '256color'
     set t_ut=
   endif
endif


" ================
" Syntastic Plugin
" ================

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode = 'passive'
let g:syntastic_mode_map = { "mode": "passive",
                            \"active_filetypes": ["xml"],
                            \"passive_filetypes": [] }

let g:syntastic_rust_checkers = ['cargo']
nmap <F4> :SyntasticToggleMode<CR>


" ==========
"  Nerdtree
" ==========

" Set width
let g:NERDTreeWinSize=30
" Open Nerdtree when started without args
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Keymapings
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-m> :NERDTreeFind<CR>
" Close vim when only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ================
"  Other Settings
" ================

" Add current dir and all subfolders to path
" (Tab-completition of file names)
" set path+=$PWD/**

" Display matches of tab complete
set wildmenu

" Enable syntax highlighting
syntax enable

set number "relativenumber "show relativ line numbers
set hidden " allows buffer switching with unsaved changes
set textwidth=80
set colorcolumn=+1

" Spellcheck
set spelllang=en,de_at
set spell
hi SpellBad cterm=underline

" Indent Settings
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

" Search settings
" set incsearch
set nohlsearch
set ignorecase

" No wrapping, better scroling
set nowrap
set scrolloff=10
set sidescroll=3
set sidescrolloff=7
set listchars+=precedes:<,extends:>

" Folding settings (za)
set foldmethod=indent
set foldnestmax=2
set nofoldenable

" Leader
let mapleader = ','
let maplocalleader = '\'

" Backup directories
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Auto-Commands
" Remove whitespaces before write
fun! SelectiveStripWhiteSpace()
   " except filetypes
   if &ft =~ 'markdown'
      return
   endif
   StripWhitespace
endfun
autocmd BufWritePre * :call SelectiveStripWhiteSpace()

" Set relative number in normal mode
" augroup numbertoogle
"    autocmd!
"    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" Filetype Settings
au FileType markdown set tw=80 ts=3 spell
au FileType tex set tw=80 ts=3 spell
au FileType yaml set tw:80 ts=2 sts=2 sw=2 expandtab
au FileType rust nmap <F5> :!cargo run<CR>
au FileType rust nmap <F6> :!cargo check<CR>
au FileType rust nmap <F7> :!cargo test -- --nocapture<CR>
au FileType rust nmap <F8> :w<CR>:silent exec "!cargo fmt"<CR>:redraw!<CR>

" Clear highlight
nmap <silent> <leader>/ :nohl<CR>
" This one had side effects when <ESC> was pressed once
" nnoremap <silent> <Esc><Esc> <Esc>:nohl<CR><ESC>

" List buffers
:nnoremap <F2> :buffers<CR>:buffer<Space>
" Close Buffer, keep window with :Bd
command Bd bp|bd #
" List buffers
nnoremap <leader>l :ls<CR>
" Go back/forward/last used
nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>
nnoremap <leader>g :e#<CR>
" Go to buffer 1/2/3/..
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>
nnoremap <leader>4 :4b<CR>
nnoremap <leader>5 :5b<CR>
nnoremap <leader>6 :6b<CR>
nnoremap <leader>7 :7b<CR>
nnoremap <leader>8 :8b<CR>
nnoremap <leader>9 :9b<CR>
nnoremap <leader>0 :10<CR>

" Vertical centered scrolling
nnoremap j jzz
nnoremap k kzz

" Faster Window switching
nmap <Tab> <C-W>w
nmap <silent> <leader>w :wincmd p<CR>
" Window switching with <Ctrl> hjkl and <Alt> arrows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <silent> <A-UP> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|d|o|swp|lst)$',
    \ 'link': ''}
"let g:ctrlp_user_command = "find %s -type f | rg -g ''!.(dll|exe|so|d|o|swp|lst)''"
let g:ctrlp_extensions = ['tag']
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
set grepprg=rg

if !empty(glob("~/.vim/ra.vim"))
    source ~/.vim/ra.vim
endif
