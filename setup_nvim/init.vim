" Pluggins

call plug#begin()

Plug 'gmarik/Vundle.vim'
" Nerd Tree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Syntax highlighting
Plug 'yuezk/vim-js'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'https://github.com/itchyny/lightline.vim.git'
" Comandos de Git desde la barra de vim:
Plug 'https://tpope.io/vim/fugitive.git'
Plug 'https://github.com/preservim/tagbar' " Tagbar
Plug 'https://github.com/tpope/vim-commentary.git'

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

set number
set relativenumber
set autoindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4
set mouse=a
set wrap
set encoding=UTF-8
set laststatus=2

