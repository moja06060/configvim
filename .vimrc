" ===============================
"     MXHA ------------- MDHA   
" ===============================
" idea: Mio y funcional


" --- IMPRESCINDIBLE ---
set nocompatible        " desactiva el modo vi antiguo
filetype plugin indent on
syntax on
set encoding=utf-8
set backspace=indent,eol,start
set laststatus=2

" --- APARIENCIA ---
set number              " muestra números de línea
"set relativenumber     " activa números relativos (opcional)
set cursorline         " resalta la línea del cursor
"set background=dark    " usa temas oscuros
"colorscheme gruvbox     " cambia el tema de color
"set termguicolors
"colo gruvbox 

" --- Tabulación / Sangria ---
set tabstop=4  " establece el numero de espacios que tiene visualmente  el \t(tabstop) ej \tHola
" set shiftwidth=4
set expandtab  " Cuando usas Tab, en vez de insetar un espacio largo \t inserta 4 espcios reales 
set autoindent
set smartindent

" --- Search ---
set ignorecase " a la hora de buscar no distinge entre mayusculas y minusculas
" set smartcase
set incsearch  " busqueda en tipo real antes de terminar de escribir te enseña las opciones
" set hlsearch

" --- Keybindings ---
" nnoremap <C-s> :w<CR>  " Ctrl + s y guarda el documenot y hace un enter
inoremap <C-s> <Esc>:w<CR>a  " Ctrl + s guarda hace Esc - GUARDAR - a para volver a escribir
" nnoremap <C-q> :q<CR> " Cierra vim con Ctrl + q 
" nnoremap <space> :noh<CR> " impiar el resaltado de búsquedas (:noh = no highlight)
nnoremap <C-e> :Explore<CR>   " Ctrl + e  abre el explorador de archivos
inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
" Compile & Run C++ with F5
nnoremap <F5> :!g++ % -o %< -std=c++17 && ./%<<CR>

" Optional: clear screen before running
nnoremap <F6> :!clear && g++ % -o %< -std=c++17 && ./%<<CR>

" --- Files & Backup ---
" set undofile
" set undodir=~/.vim/undo
" set noswapfile
" set nobackup
" set nowritebackup

" --- Performance ---
" set lazyredraw
" set ttyfast

" --- Plugins --- " Aquí puedes o deves añadir gestión vim-plug o packpath si quieres plugins
call plug#begin('~/.vim/plugged')

" Status bar
Plug 'itchyny/lightline.vim'
" Auto completado de SQL
Plug 'vim-scripts/sqlcomplete.vim'

" arbol de archibos
Plug 'preservim/nerdtree'
" ni idea no funciona peor es un tester
Plug 'janko-m/vim-test'
" --- C++ / desarrollo ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Autocompletado inteligente (LSP)
Plug 'preservim/nerdtree'                         " Explorador de archivos
Plug 'jiangmiao/auto-pairs'                       " Cierra () {} [] automáticamente
Plug 'tpope/vim-commentary'                       " Comentarios rápidos (gc)
Plug 'dense-analysis/ale'                         " Linter/formatting asíncrono (alternativa ligera)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
call plug#end()

" --- Tabulador para autocompletar coc --- "
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
    \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() : "\<CR>"


" --- Configuración del Plugin ligthtline ---
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ] ]
      \ },
      \ }

" --- Lenguajes de programación ---
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

" --- Personal Notes ---
set termguicolors
set background=dark
colorscheme gruvbox


" experimenta y añade tus propias opciones  
