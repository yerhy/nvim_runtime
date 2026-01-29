" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/nvim_runtime/plugged')
Plug 'mhinz/vim-startify'
Plug 'xolox/vim-misc'
" Plug 'preservim/nerdtree'  " 已替换为 neo-tree
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
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
Plug 'folke/tokyonight.nvim'
" Plug 'norcalli/nvim-colorizer.lua'
Plug 'xolox/vim-notes'
" Plug 'vim-scripts/fcitx.vim'
Plug 'brooth/far.vim'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
" Plug 'github/copilot.vim'  " 暂时禁用，使用 avante.nvim 替代
Plug 'zenbro/mirror.vim'
Plug 'tpope/vim-fugitive'
Plug 'folke/which-key.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => avante.nvim (多模型 AI 助手)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
Plug 'HakonHarnes/img-clip.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'
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
" => Neo-tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local neotree_ok, neotree = pcall(require, "neo-tree")
if neotree_ok then
  neotree.setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    window = {
      position = "left",
      width = 40,
      mappings = {
        ["<space>"] = "none",
        ["o"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["t"] = "open_tabnew",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy",
        ["m"] = "move",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
      },
    },
    renderer = {
      group_empty_dirs = false,
      highlight_git = true,
      highlight_modified = true,
      indent_size = 2,
      indent_markers = {
        enable = true,
      },
      icons = {
        git_placement = "signcolumn",
      },
      full_name = true,
      truncate_to_fit = false,
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
          "node_modules",
          "__pycache__",
        },
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },
    git_status = {
      window = {
        position = "float",
      },
    },
  })
end
EOF

" Neo-tree 快捷键
map <leader>nn :Neotree toggle<cr>
map <leader>nf :Neotree reveal<cr>
map <leader>ng :Neotree git_status<cr>



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
let g:indentLine_fileType = ['py', 'yaml', 'yml', 'go']


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => which-key.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
  wk.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = false },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      border = "rounded",
      padding = { 2, 2, 2, 2 },
    },
  }
  
  wk.add({
    { "<leader>n", group = "Neo-tree" },
    { "<leader>nn", desc = "Toggle Neo-tree" },
    { "<leader>nf", desc = "Reveal current file" },
    { "<leader>ng", desc = "Git status" },
    { "<leader>b", desc = "Buffers (fzf)" },
    { "<leader>w", desc = "Windows (fzf)" },
    { "<leader>m", desc = "Marks (fzf)" },
    { "<leader>h", desc = "History (fzf)" },
    { "<leader>t", desc = "Tags (fzf)" },
    { "<leader>f", desc = "Floaterm fzf" },
    { "<leader>r", desc = "Ranger" },
    { "<leader>z", desc = "Goyo (Zen mode)" },
    { "<leader>c", desc = "CocCommand" },
  })
end
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-colorizer.lua (已禁用以提升大文件性能)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua << EOF
" local colorizer_ok, colorizer = pcall(require, "colorizer")
" if colorizer_ok then
"   colorizer.setup({
"     filetypes = { '*', '!packer' },
"     user_default_options = {
"       RGB = true,
"       RRGGBB = true,
"       names = true,
"       RRGGBBAA = false,
"       rgb_fn = false,
"       hsl_fn = false,
"       css = false,
"       css_fn = false,
"       mode = 'background',
"       tailwind = false,
"       sass = { enable = false, parsers = { css = true } },
"       virtualtext = '■',
"     },
"     buftypes = {},
"   })
" end
" EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => avante.nvim 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local avante_config = {
  provider = "deepseek",  -- 默认使用 copilot
  auto_suggestions_provider = "copilot",
  behaviour = {
    auto_suggestions = true,  -- 启用自动建议
    auto_set_highlight_group = true,
    set_cursor = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
  },
  providers = {
    copilot = {
      endpoint = "https://api.githubcopilot.com",
      model = "gpt-4o",  -- 使用 Copilot 支持的模型
      proxy = nil,
      allow_insecure = false,
      timeout = 30000,
    },
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o",
      timeout = 30000,
      extra_request_body = {
        temperature = 0,
        max_tokens = 4096,
      },
    },
    deepseek = {
      __inherited_from = "openai",  -- 继承 openai 提供者（DeepSeek API 兼容 OpenAI 格式）
      endpoint = "https://api.deepseek.com",
      model = "deepseek-chat",  -- DeepSeek Chat 模型（Reasoner 需要特殊处理）
      timeout = 30000,
      extra_request_body = {
        temperature = 0,
        max_tokens = 4096,
      },
      api_key_name = "DEEPSEEK_API_KEY",
    },
    glm = {
      __inherited_from = "openai",  -- 继承 openai 提供者（GLM API 兼容 OpenAI 格式）
      endpoint = "https://open.bigmodel.cn/api/paas/v4",
      model = "glm-4",
      timeout = 30000,
      extra_request_body = {
        temperature = 0,
        max_tokens = 4096,
      },
      -- api_key = "your-glm-api-key",  -- 或使用环境变量 AVANTE_GLM_API_KEY
    },
  },
  mappings = {
    ask = "<leader>aa",
    edit = "<leader>ae",
    refresh = "<leader>ar",
    focus = "<leader>af",
    toggle = {
      default = "<leader>at",
      debug = "<leader>ad",
      hint = "<leader>ah",
      suggestion = "<leader>as",
      repomap = "<leader>aR",
    },
    suggestion = {
      accept = "<Tab>",        -- Tab 接受建议
      next = "<M-]>",          -- Alt + ] 下一个建议
      prev = "<M-[>",          -- Alt + [ 上一个建议
      dismiss = "<C-]>",       -- Ctrl + ] 拒绝建议
    },
    sidebar = {
      apply_all = "A",
      apply = "a",
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
    },
  },
  hints = { enabled = true },
  windows = {
    position = "right",
    width = 30,
    sidebar_header = {
      align = "center",
      rounded = true,
    },
    ask = {
      floating = false,
      start_insert = true,
      border = "rounded",
      opts = {},
    },
    edit = {
      floating = false,
      border = "rounded",
    },
  },
  highlights = {
    diff = {
      add = { fg = "#c3e88d" },
      remove = { fg = "#e07a5f" },
      text = { fg = "#89b4fa" },
    },
  },
}

-- 加载 avante
local avante_ok, avante = pcall(require, "avante")
if avante_ok then
  avante.setup(avante_config)
  vim.keymap.set("n", "<leader>ap", function()
    require("avante.api").ask({ provider = "copilot" })
  end, { desc = "Ask with Copilot" })

  vim.keymap.set("n", "<leader>ag", function()
    require("avante.api").ask({ provider = "deepseek" })
  end, { desc = "Ask with DeepSeek" })

  vim.keymap.set("n", "<leader>az", function()
    require("avante.api").ask({ provider = "glm" })
  end, { desc = "Ask with GLM" })

  vim.keymap.set("n", "<leader>ao", function()
    require("avante.api").ask({ provider = "openai" })
  end, { desc = "Ask with OpenAI" })
end

-- Treesitter 配置
local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if treesitter_ok then
  treesitter.setup({
    ensure_installed = {
      "vim", "vimdoc", "lua", "python", "javascript", "typescript",
      "java", "go", "rust", "cpp", "c", "bash", "markdown", "markdown_inline"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end

-- img-clip.nvim 配置
local img_clip_ok, img_clip = pcall(require, "img-clip")
if img_clip_ok then
  img_clip.setup({
    default = {
      dir_path = "img",
      file_name = "%Y-%m-%d-%H-%M-%S",
      use_absolute_path = false,
      prompt_for_file_name = false,
      drag_and_drop = {
        insert_mode = true,
      },
    },
  })
end
EOF



