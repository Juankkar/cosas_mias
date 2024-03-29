" Pluggins

 call plug#begin()
 
 " background

Plug 'nightsense/snow'

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
Plug 'Yggdroot/indentLine' " Indent line para marcar las tabulaciones
" Comandos de Git desde la barra de nvim:
Plug 'https://tpope.io/vim/fugitive.git'
Plug 'https://github.com/preservim/tagbar' " Tagbar
Plug 'https://github.com/tpope/vim-commentary.git'
 
" R programming nvim
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

" Vim 8 only
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Optional: for snippet support
" Further configuration might be required, read below
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'

" Optional: better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'

" Snameke plugs
Plug 'raivivek/vim-snakemake'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Shortcuts
nnoremap <C-f> :NERDTreeFocus<CR> 
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR> 
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown):<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

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


colorscheme snow

if strftime('%H') >= 7 && strftime('%H') < 19
  set background=light
else
  set background=dark
endif
