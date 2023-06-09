call plug#begin("~/.config/nvim/plugged")
    Plug 'w0rp/ale'
    Plug 'github/copilot.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'tomasr/molokai', { 'as': 'molokai' } 
    Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
    Plug 'romgrk/barbar.nvim'
    "Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-commentary'
    Plug 'mattn/emmet-vim'
    Plug 'manzeloth/live-server'
    Plug 'windwp/nvim-autopairs'
    Plug 'mhinz/vim-startify'
call plug#end()

map <C-p> :FZF<CR>
map <C-b> :Buffers<CR>
map <C-f> :Files<CR>
map <C-g> :GFiles<CR>

colorscheme catppuccin
" colorscheme molokai
set number
set relativenumber
set hidden

set nobackup
set noswapfile
set nowritebackup

set expandtab
set tabstop=5
set shiftwidth=4
set clipboard=unnamedplus

nnoremap bb :b#<CR>

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}


" Airline
" let g:airline_theme='minimalist'
let g:airline_theme='catppuccin'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W'

let g:netrw_banner=0


" CoC remappings
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"


" NERDTree 
let mapleader = ","
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <Space>n :NERDTree<CR>
" nnoremap <Space>e :NERDTreeToggle<CR>
" nnoremap <Space>f :NERDTreeFind<CR>
nnoremap <Space>t :NERDTreeToggle<CR>
nnoremap <Space>f :NERDTreeFocus<CR>

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" buffer stuff
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Restore buffer
nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>


nnoremap <Tab> >>
nnoremap <S-Tab> <<

inoremap jk <c-c>`^
" inoremap ii <c-c>`^
vnoremap <silent>   <A-l> <Cmd>LiveServer start<CR>
vnoremap <silent>   <A-e> <Cmd>LiveServer end<CR>


let g:user_emmet_expandabbr_key='<C-y>'

lua << EOF
require("nvim-autopairs").setup()
EOF

