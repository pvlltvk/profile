" Enable vim-plug manager and install plugins

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'nginx/nginx', {'rtp': 'contrib/vim'}
Plug 'elzr/vim-json'
Plug 'pearofducks/ansible-vim'

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
