
" ======= Plugins ======

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Coc Settings
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
autocmd BufWritePre *.go :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
let g:go_fmt_command = "goimports"
autocmd FileType go nmap <silent> gd <Plug>(go-def-tab)
" let g:go_def_mapping_enabled = 0

Plug 'vim-scripts/AfterColors.vim'          " customize color schemes
Plug 'ConradIrwin/vim-bracketed-paste'      " better copy-paste in insert mode
Plug 'wesQ3/vim-windowswap'                 " swap windows

" Typescript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1

Plug 'ruanyl/vim-sort-imports'
Plug 'gabrielelana/vim-markdown'

" Nerd Tree (filesystem)
Plug 'scrooloose/nerdtree'                  " file explorer (nerd tree)
Plug 'jistr/vim-nerdtree-tabs'              " persistent nerd tree
nnoremap \ :NERDTreeTabsToggle<Cr>
nnoremap \| :NERDTreeFind<Cr>
" let NERDTreeWinSize = 30
let NERDTreeShowHidden=0
let NERDTreeCascadeSingleChildDir=0

Plug 'jlanzarotta/bufexplorer'              " buffer exploring
nnoremap B :ToggleBufExplorer<Cr>
let g:bufExplorerSortBy='mru'

" Not related to bufexplorer, but this is how we switch buffers
Plug 'mildred/vim-bufmru'
nnoremap <tab> :BufMRUNext<CR>
noremap <S-tab> :BufMRUPrev<CR>

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

" Tabs format
Plug 'gcmt/taboo.vim'
let g:taboo_modified_tab_flag="+"
let g:taboo_tab_format=' %N. %f %m '

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <c-t> :FZF<cr>

Plug 'mhinz/vim-startify'                   " start screen
Plug 'DataWraith/auto_mkdir'                " mkdir -p for creating files

" Linting / fixing
Plug 'w0rp/ale'
" let g:ale_fix_on_save = 1
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_enter = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier', 'tslint']
\}
let g:ale_linters = {
\   'javascript': ['flow'],
\}

" MRU (recently opened files)
Plug 'vim-scripts/mru.vim'
let MRU_File = $HOME . '/.vim_mru_files'
let MRU_Window_Height = 15
nnoremap mr :MRU<cr>

Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'                 " auto pair brakcets, parens, quotes

" Plug 'airblade/vim-gitgutter'               " show diff in code
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
let g:signify_sign_show_text = 0

" Better scrolling
Plug 'terryma/vim-smooth-scroll'
nnoremap <CR> :call smooth_scroll#down(25, 20, 2)<cr>
nnoremap <silent> <c-d> :call smooth_scroll#down(15, 20, 2)<cr>
nnoremap <silent> <c-u> :call smooth_scroll#up(15, 20, 2)<cr>

Plug 'tpope/vim-fugitive'                   " git integration

" Requires local config, used for gitlab access token
Plug 'shumphrey/fugitive-gitlab.vim'
if !empty(glob("~/.local.vim"))
  source $HOME/.local.vim
endif

Plug 'ntpeters/vim-better-whitespace'       " whitespace handler
highlight ExtraWhitespace ctermbg=red

Plug 'tpope/vim-surround'                   " surround words with characters
Plug 'tpope/vim-commentary'                 " easily comment out code
Plug 'tpope/vim-repeat'                     " better repeat (.)
Plug 'wellsjo/vim-save-cursor-position'     " Save cursor position when you exit files

" Languages
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'gf3/peg.vim'
Plug 'chr4/nginx.vim'

" Color Schemes
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'wellsjo/wellsokai.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'rakr/vim-one'

call plug#end()

" =============================================================================

set showcmd                         " Show the command as you type

" Search
set ignorecase                      " Case-insensitive search
set smartcase                       " Case-sensitive search when using caps
set incsearch                       " Show match while typing pattern
set hlsearch                        " Highlight search results

" Colors, syntax
syntax on                           " Syntax highlighting
set number                          " Show number lines
set autoindent
filetype plugin indent on
let t_Co=256
let mapleader=" "
let g:netrw_dirhistmax = 0
set term=screen-256color

set background=dark " for the dark version

colorscheme wellsokai
" colorscheme github

" editing, tabs, indenting
set expandtab                       " Tab key creates spaces
set smarttab
set cindent
set tabstop=2                       " Number of space for tab character
set softtabstop=2                   " Number of spaces in tab when editing
set shiftwidth=2                    " Number of spaces used for >>, <<, ==
set backspace=2                     " Best backspace setting
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

" Search and highlight words under cursor (toggle)
imap <c-f> <c-x><c-f>
nnoremap <c-f> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls!<CR>

" Toggle highlighting
imap <c-h> <c-x><c-h>
nnoremap <c-h> :set hlsearch!<CR>

" Easy motion
map <Leader> <Plug>(easymotion-prefix)

" GoImports shorthand
nnoremap gim :OR<CR>

" Fast quit
nnoremap <leader>q :q<CR>

" Quick write
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

" Yank line without newline character
nmap yu yg$

" File completion with control-f in insert mode
" Plug 'valloric/youcompleteme'
" let g:ycm_autoclose_preview_window_after_completion=1

" Better mapping for repeating macros
map , @


" Search and replace word under cursor
nnoremap s :%s/\<<C-r><C-w>\>/

" Go def in new tab
" autocmd FileType typescript nmap <silent> gd :TsuDefinition<CR>
" this also works in python?

" Persistent undo and swp files
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

" tell vim where to put its backup files
set backupdir=/private/tmp

" ======= Plugin Settings =======

" vim-javascript
" Enable syntax highlighting for JSDoc comments
let g:javascript_plugin_jsdoc = 1


" use prettier for formatting
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'

" Auto completion with tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Setup python to use custom styles
" This is called in ftplugin/python.vim
function! SetupPython()
  setlocal softtabstop=2
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction
command! -bar SetupPython call SetupPython()
