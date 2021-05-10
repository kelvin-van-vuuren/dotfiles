call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'vim-airline/vim-airline' "Cool statusline
Plug 'vim-airline/vim-airline-themes' "Airline themes
Plug 'Shougo/context_filetype.vim' "Allow neosnippet to switch filetype on context
Plug 'ludovicchabant/vim-gutentags' "ctag management
Plug 'scrooloose/syntastic' "Syntax checker
Plug 'tpope/vim-fugitive' "Useful git commands
Plug 'notpratheek/vim-luna' "Nice theme
Plug 'https://notabug.org/SylvieLorxu/vim-betterK.git' "Improve K command

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ThePrimeagen/vim-be-good'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/lsp-trouble.nvim'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()

let mapleader = " "

" Marker based folding in vim files
autocmd FileType vim setlocal foldmethod=marker

"inoremap jk <ESC>
" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" switch between source and header:
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"[airline] Always show numbered listed of buffers
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

"[gutentags] Don't pollute project dirs
let g:gutentags_cache_dir = '~/.vim/tags/'

"[neocomplete] Use tab to select a completion, Ctrl+K to expand a snippet,
"Ctrl+H to close Neocomplete
let g:neocomplete#enable_at_startup = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><C-h> pumvisible() ? "\<C-y>" : "\<C-h>"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on
"set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

"Theming
"syntax enable
"colorscheme luna-term
"let g:airline_theme='luna'
let g:airline_powerline_fonts=1 "Requires powerline fonts!
"set cursorline

"Save as sudo with w!! (when lacking root)
cmap w!! w !sudo tee % >/dev/null

"Force use of 256 colours
"set t_Co=256

"Buttons for going to previous/next file (buffer)
map <C-[> :bprevious<CR>
map <C-]> :bnext<CR>
"Show a list of files (buffers) that are open
map <F2> :buffers<CR>
"Yank (copy) contents of current file (buffer) - also to X11 clipboard
map <F5> :%y+<CR>
"Show name of file and path relative to current working directory
map <F6> :echo @%<CR>
"Show current working directory
map <F7> :pwd<CR>
"Close current buffer
map <F12> :bd!<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
