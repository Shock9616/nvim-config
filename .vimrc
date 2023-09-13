" Kaleb Rosborough's barebones (Neo)Vim config

" Enable syntax highlighting
syntax on

" Line numbers
set number
set relativenumber

" Turn off swapfile/backup
set noswapfile
set nobackup

" Undo file
set undodir=$HOME/.vim/undodir
set undofile
set undolevels=10000

" Search settings
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Update/timeout time
set updatetime=50
set timeoutlen=300

" Sync with system clipboard
" set clipboard=unnamedplus

" Completion/Wildmode
set completeopt=menu,menuone,noselect
set wildmode=longest:full,full

" Confirm to save changes before exiting modified buffer
set confirm

" Use spaces instead of tabs
set expandtab

" Scrolloff
set scrolloff=8

" Indent settings
set shiftround
set shiftwidth=4
set smartindent
set tabstop=4

" Window settings
set splitbelow
set splitright

" Disable line wrap
set nowrap

" ---------- Keymaps ----------
let mapleader=" "

" Better Indenting
vmap < <gv
vmap > >gv

" Window
nmap <leader>wh :split<CR>
nmap <leader>wv :vsplit<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <leader>w<Up> :resize +10<cr>
nmap <leader>w<Down> :resize -10<cr>
nmap <leader>w<Left> :vertical resize -10<cr>
nmap <leader>w<Right> :vertical resize +10<cr>
nmap <leader>wq :wq<cr>

" File
nmap <leader>fn :enew<cr>
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

nmap <leader>fe :call ToggleNetrw()<CR>

" Buffer
nmap <S-h> :bprev<CR>
nmap <S-l> :bnext<CR>
nmap <leader>bd :bd<cr>
nmap <leader>ba ggVG

" Move selected text up and down
vmap K :m '<-2<CR>gv=gv " Up
vmap J :m '>+1<CR>gv=gv " Down

" Keep cursor in the center when scrolling
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz

" Keep search terms in the center
nmap n nzzzv
nmap N Nzzzv

" Terminal
nmap <leader>th :term<cr>
nmap <leader>tv :vertical term<cr>
