set number
set relativenumber
set autoindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4
set mouse=a


call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/morhetz/gruvbox'        

call plug#end()
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
