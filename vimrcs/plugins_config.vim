" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/nvim_runtime/plugged')
Plug 'preservim/nerdtree'
call plug#end()
