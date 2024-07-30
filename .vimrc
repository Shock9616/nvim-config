"
" Kaleb Rosborough's Vim config file
"   (Based off my Neovim config at https://github.com/shock9616/nvim-config)
"

" ---------- Options ----------
" Set keymap leader key
let mapleader=" "
let maplocalleader="\\"

" Visual options
set number
set relativenumber
syntax on
set termguicolors
set noshowmode
set signcolumn = "yes"
set nowrap
set cursorline
set colorcolumn=81

" General options
set autowrite
set noswapfile
set nobackup
set undodir=".vim/undodir/"
set undofile
set undolevels=10000
set confirm

set ignorecase
set smartcase
set smartindent

set clipboard="unnamedplus"
set completeopt="menu,menuone,noselect"
set wildmode="longest:full,full"
set sessionoptions=buffers,curdir,tabpages,winsize

set expandtab
set shiftround
set shiftwidth=4
set tabstop=4

set scrolloff=10
set sidescrolloff=10

set grepformat="%f:%l:%c:%m"

set splitbelow
set splitright

set laststatus=0
set nolist
set spelllang="en"

" ---------- Keymaps ----------

" Better redo
nmap U <C-r>
"
" Move between buffers using <Shift> hl keys
nmap <S-h> <cmd>bprev<cr>
nmap <S-l> <cmd>bnext<cr>

" Better indenting
vmap < <gv
vmap > >gv

" Keep cursor in the same place when using 'J' keymap
nmap J mzJ`z

" Keep cursor in the center when scrolling
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz

" Keep search terms in the center
nmap n nzzzv
nmap N Nzzzv

" New file
nmap fn <cmd>enew<cr>

" Buffer commands
nmap <leader>bd <cmd>bd<cr>
nmap <leader>ba ggVG
nmap <leader>bc zz
nmap <leader>bf <cmd>Autoformat<cr>

" Window commands
nmap <leader>w- <cmd>split<cr>
nmap <leader>w\\ <cmd>vsplit<cr>
nmap <leader>w<Up> <cmd>resize +10<cr>
nmap <leader>w<Down> <cmd>resize -10<cr>
nmap <leader>w<Left> <cmd>vertical resize -10<cr>
nmap <leader>w<Right> <cmd>vertical resize +10<cr>
nmap <leader>wq <cmd>wq<cr>

" ---------- Plugins ----------

" Bootstrap Vim-Plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Colourscheme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Statusline
Plug 'vim-airline/vim-airline'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'vim-autoformat/vim-autoformat'

Plug 'elihunter173/dirbuf.nvim'

call plug#end()

" ----- Plugins Configuration -----

" Catppuccin
colorscheme catppuccin_macchiato

" Airline
let g:airline_theme = 'catppuccin_mocha'

let g:airline_section_b = airline#section#create(["%f"])
let g:airline_section_c = airline#section#create(["branch", "hunks"])
let g:airline_section_x = airline#section#create([])
let g:airline_section_z = airline#section#create(["%l", ":", "%c"])
