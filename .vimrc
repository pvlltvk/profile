" Enable vim-plug manager
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'nginx/nginx', {'rtp': 'contrib/vim'}
Plug 'elzr/vim-json'

call plug#end()

" Set solarized dark theme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Display line numbers
set number
:set numberwidth=3

" Set tab as 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Start NERDTree
autocmd VimEnter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p
