let mapleader=" "

syntax on
set number
set autoindent
filetype plugin indent on
let t_Co=256
let g:netrw_dirhistmax = 0
set term=screen-256color
set background=dark

" Go back to where you left off when opening files
" au BufReadPost * if line("'\"") | execute("normal `\"") | endif

" Search and highlight words under cursor (toggle)
imap <c-f> <c-x><c-f>
nnoremap <c-f> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls!<CR>

" Toggle highlighting
imap <c-h> <c-x><c-h>
nnoremap <c-h> :set hlsearch!<CR>

" Quit
map <leader>q :q<CR>
map <leader>Q :qa<CR>

" Write
nnoremap <leader>f :w<CR>

" Quick way to format a file
nnoremap <leader>g gg=G''zz

" Save while in insert mode with 'jj'
inoremap jj <esc>:w<CR>
" Stop editing in place with 'jk'
inoremap jk <esc>:<cr><right>

" Quickly switch tabs
nnoremap gr gT

" Arrow keys to resize windows
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>

" Auto-center search results
nnoremap n nzz
nnoremap N Nzz

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move windiws with j, k, o, p
map <silent> <C-o> :wincmd h<CR>
map <silent> <C-p> :wincmd l<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>

" Better mapping for repeating macros
map , @

" Search and replace word under cursor
nnoremap s :%s/\<<C-r><C-w>\>/

" Show the command as you type
set showcmd

" Search
" Case-insensitive search
set ignorecase
" Case-sensitive search when using caps
set smartcase
" Show match while typing pattern
set incsearch
" Highlight search results
set hlsearch

set expandtab
set smarttab
set cindent
" Number of space for tab character
set tabstop=2
" Number of spaces in tab when editing
set softtabstop=2
" Number of spaces used for >>, <<, ==
set shiftwidth=2
set backspace=2
scriptencoding utf-8
set encoding=utf-8

" status bar
set laststatus=2
" set cursorline
set nocursorcolumn

" Enable mouse/trackpad input
if has("mouse")
  set mouse=n
endif

" Enables resizing vim panes from tmux
if &term =~ '^screen'
  set ttymouse=xterm2
endif

" When editing a file, always jump to the last cursor position
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

" ====== PLUGINS (Plugged) =====

call plug#begin('~/.vim/plugged')

" ===== Languages =====

Plug 'gabrielelana/vim-markdown'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'gf3/peg.vim'
Plug 'chr4/nginx.vim'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
au FileType go nmap gim :GoImports<CR>
au FileType go nmap gb :GoBuild<CR>
" By default, 'gd' does go-def in the same buffer, so we disable
" the default and make our own use go-def-tab.
let g:go_def_mapping_enabled = 0
au FileType go nmap <silent> gd <Plug>(go-def-tab)
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0

" JavaScript
Plug 'pangloss/vim-javascript'
" Enable syntax highlighting for JSDoc comments
let g:javascript_plugin_jsdoc = 1
Plug 'mxw/vim-jsx'
" Sort imports for javascript/typescript
Plug 'ruanyl/vim-sort-imports'

" Typescript
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
au FileType typescript nmap <silent> gd :TsuDefinition<CR>
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1

" Python
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

" ===== Text Editing =====

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Linting
Plug 'dense-analysis/ale'
let g:ale_fixers = {
      \   'javascript': ['prettier'],
      \   'typescript': ['prettier', 'tslint'],
      \   'python': ['autopep8', 'reorder-python-imports'],
      \}
let g:ale_linters = {
      \   'typescript': ['tslint', 'tsserver'],
      \   'javascript': ['prettier'],
      \   'go': ['go build'],
      \}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

Plug 'ntpeters/vim-better-whitespace'
hi ExtraWhitespace ctermbg=red

Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)

" ===== Editor =====

" Nerd Tree (file explorer)
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
nnoremap \ :NERDTreeTabsToggle<Cr>
nnoremap \| :NERDTreeFind<Cr>
let NERDTreeShowHidden=0
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

" Buffers
Plug 'jlanzarotta/bufexplorer'
nnoremap B :ToggleBufExplorer<Cr>
let g:bufExplorerSortBy='mru'
Plug 'mildred/vim-bufmru'
nnoremap <tab> :BufMRUNext<CR>
noremap <S-tab> :BufMRUPrev<CR>

" Window Management
Plug 'wesQ3/vim-windowswap'

" Better scrolling
Plug 'terryma/vim-smooth-scroll'
nnoremap <CR> :call smooth_scroll#down(25, 20, 2)<cr>
nnoremap <silent> <c-d> :call smooth_scroll#down(15, 20, 2)<cr>
nnoremap <silent> <c-u> :call smooth_scroll#up(15, 20, 2)<cr>

" Tabs
Plug 'gcmt/taboo.vim'
let g:taboo_modified_tab_flag="+"
let g:taboo_tab_format=' %N. %f %m '

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
nnoremap <c-t> :FZF<cr>

" Open Recent Files
Plug 'vim-scripts/mru.vim'
let MRU_File = $HOME . '/.vim_mru_files'
let MRU_Window_Height = 15
nnoremap mr :MRU<cr>

" Git
Plug 'tpope/vim-fugitive', { 'on': ['Gbrowse', 'Gblame'] }

" Show Deltas
Plug 'mhinz/vim-signify', { 'commit': 'd80e507' }
let g:signify_sign_show_text = 0

" NOTE: Requires local config, used for gitlab access token
Plug 'shumphrey/fugitive-gitlab.vim'
if !empty(glob("~/.local.vim"))
  source $HOME/.local.vim
endif

" ===== Styling =====
Plug 'wellsjo/wellsokai.vim'
Plug 'NLKNguyen/papercolor-theme'
function SwitchToLight()
  set background=light
  colo PaperColor
endfunction
command! SwitchToLight call SwitchToLight()

function SwitchToDark()
  set background=dark
  colo wellsokai
endfunction
command! SwitchToDark call SwitchToDark()

" Color Schemes
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Undo / Swap / Backups
set undolevels=1000
set undoreload=1000
if !isdirectory(expand("~/.vim/.swap/"))
  silent !mkdir -p ~/.vim/.swap
endif
if !isdirectory(expand("~/.vim/.undo/"))
  silent !mkdir -p ~/.vim/.undo
endif
set directory^=~/.vim/.swap//
set undodir^=~/.vim/.undo//
set undofile
set backupdir=/private/tmp

call plug#end()

" Call functions that need Plug loaded...

colo wellsokai
