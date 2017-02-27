" ====================
" VUNDLE CONFIGURATION
" ====================
set nocompatible              " be iMproved, required
filetype off                  " required

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
"Plugin 'vim-scripts/CycleColor'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'lervag/vimtex'
Plugin 'altercation/vim-colors-solarized'
"Rust
Plugin 'racer-rust/vim-racer'
"Plugin 'rust-lang/rust.vim'
Plugin 'innerand/rust.vim'
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
"==================================
"AIRLINE (Status line) Configuration
"==================================
"
" Always display status line in last window
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
" \Airline

" ===========
" Colorscheme
" ===========
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

" ===================
" Racer Plugin (Rust)
" ===================
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"

au FileType rust nmap gs <Plug>(rust-def-split)

" ==============
" BASIC SETTINGS
" ==============

syntax enable
set number "show line numbers

" set textwidth=80

" Languages for spell check
" usage: set spell / set unspell, ]s, z=
set spelllang=en,de_at

"indent Settings
set autoindent
set smartindent
set tabstop=3
set expandtab
set shiftwidth=3
set softtabstop=3

"Search settings
set incsearch
set hlsearch
set ignorecase

" No wrapping, better scroling
set nowrap
set scrolloff=3
set sidescroll=3
set sidescrolloff=7
set listchars+=precedes:<,extends:>

" Folding settings (za)
set foldmethod=indent
set foldnestmax=2
set nofoldenable

" Custom Keymappings
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

" Filetype Settings
au FileType markdown set tw=80 ts=3 spell
au FileType tex set tw=80 ts=3 spell

" Make double-<Esc> clear highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohl<CR><ESC>
