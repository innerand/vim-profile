" ======================
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
"Plugin 'vim-scripts/CycleColor'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'lervag/vimtex'
Plugin 'altercation/vim-colors-solarized'
"Rust
Plugin 'Valloric/YouCompleteMe'
"Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'

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
"
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

let g:airline_theme='papercolor'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#bufferline#enabled = 1
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
   set background=light
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
let g:syntastic_check_on_open = 1
let g:syntatsic_check_on_wq = 0

let g:syntastic_rust_checkers = ['cargo']
nmap <F4> :SyntasticToggleMode<CR>


" ===============
"  YouCompleteMe
" ===============

let g:ycm_rust_src_path = '/home/innerand/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_filetype_whitelist = { 'rust' : 1 }


" ==========
"  Nerdtree
" ==========

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
set path+=**

" Display matches of tab complete
set wildmenu

" Enable syntax highlighting
syntax enable

set number  relativenumber "show relativ line numbers
set hidden " allows buffer switching with unsaved changes
set textwidth=80

" Spellcheck
set spelllang=en,de_at
set spell

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
augroup numbertoogle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Filetype Settings
au FileType markdown set tw=80 ts=3 spell
au FileType tex set tw=80 ts=3 spell
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
nnoremap <leader>b :bp<CR>
nnoremap <leader>f :bn<CR>
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

