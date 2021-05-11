call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'folke/tokyonight.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'folke/lsp-trouble.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()

let mapleader = " "

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

lua require'lspconfig'.ccls.setup{}
lua require('gitsigns').setup()
lua vim.g.tokyonight_italic_functions = true
let g:dashboard_default_executive ='telescope'

syntax enable
colorscheme tokyonight

"Save as sudo with w!! (when lacking root)
cmap w!! w !sudo tee % >/dev/null

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
