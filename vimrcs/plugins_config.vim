" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/nvim_runtime/plugged')
Plug 'mhinz/vim-startify'
Plug 'xolox/vim-misc'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'mileszs/ack.vim'
Plug 'yegappan/mru'
Plug 'amix/open_file_under_cursor.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'NLKNguyen/papercolor-theme'
Plug 'xolox/vim-notes'
" Plug 'vim-scripts/fcitx.vim'
Plug 'brooth/far.vim'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'github/copilot.vim'
Plug 'zenbro/mirror.vim'
Plug 'tpope/vim-fugitive'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:ascii = [
          \ '        __',
          \ '.--.--.|__|.--------.',
          \ '|  |  ||  ||        |',
          \ ' \___/ |__||__|__|__|',
          \ '',
          \ '帮助乌干达的可怜儿童',
          \]
let g:startify_custom_header =
          \ 'startify#center(g:ascii + startify#fortune#boxed())'
" let g:startify_custom_header =
"       \ 'startify#center(startify#fortune#cowsay())'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=20
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=180
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'}

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '35%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"map <leader>f :FZF<CR> 
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-l> <plug>(fzf-complete-line)




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ranger-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ranger_map_keys = 0
map <leader>r :Ranger<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ack-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>b :Buffers<cr>
map <leader>w :Windows<cr>
map <leader>m :Marks<cr>
map <leader>h :History<cr>
map <leader>t :Tags<CR> 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-floatterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>r :FloatermNew ranger<cr>
map <leader>f :FloatermNew fzf<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => papercolor-theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_fileTpe = ['py', 'yaml', 'yml', 'go']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>c :CocCommand 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => copilot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mirror.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :MirrorEnvironment - show default environment for current project.
" :MirrorEnvironment <environment> - set default <environment> for current session.
" :MirrorEnvironment! <environment> - set default <environment> globally.
" :MirrorEdit <environment> - open remote version of a local file.
" :MirrorDiff <environment> - open vertical split with difference between remote and local file. Use :diffoff to exit diff mode. Use g:mirror#diff_layout to change default split layout for this command.
" :MirrorPush <environment> - overwrite remote file by local file. If you are using neovim, the command will be executed asynchronously, otherwise synchronously.
" :MirrorPull <environment> - overwrite local file by remote file. If you are using neovim, the command will be executed asynchronously, otherwise synchronously.
" :MirrorOpen <environment> - open remote project directory in file explorer (netrw).
" :MirrorRoot <environment> - open remote system root directory in file explorer.
" :MirrorParentDir <environment> - open remote parent directory of local file.
" :MirrorSSH <environment> - establish ssh connection with selected <environment> and jump to the remote project directory. Use g:mirror#ssh_auto_cd to change default behaviour. See also g:mirror#ssh_shell. If you are using neovim, the command will be executed in a new terminal buffer.
" :MirrorInfo <environment> - get information about remote file.
let g:mirror#config_path = expand('~/.config/.mirrors')
