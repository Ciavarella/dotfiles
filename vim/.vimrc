" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

set clipboard=unnamed
set encoding=utf-8

" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set autoread
set hidden
set spell
set lazyredraw
let g:PHP_outdentphpescape = 0
set fillchars=vert:\ ,fold:\  listchars=tab:⎸\ ,nbsp:⎕
set linebreak showbreak=↪\  breakindent breakindentopt=shift:-2
set formatoptions+=nj
syntax on

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ===================== Plug Installation ====================
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'

" the path to python3 is obtained through executing `:echo exepath('python3')` in vim
let g:python3_host_prog = "/usr/local/bin/python3"
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'lifepillar/vim-mucomplete'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#empty_message = 'No branch detected'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#show_line_numbers = 1
let airline#extensions#ale#open_lnum_symbol = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'

"Python
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"

"PHP
Plug 'mkusher/padawan.vim'
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug '2072/PHP-Indenting-for-VIm'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'

"Editor setup
"Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'

"Theme
"Plug 'morhetz/gruvbox'
"Plug 'gosukiwi/vim-atom-dark'
" Plug 'joshdick/onedark.vim'
" let g:onedark_termcolors=256
Plug 'arzg/vim-colors-xcode'
Plug 'sheerun/vim-polyglot'

Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
let NERDTreeShowHidden=1


" Syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'storyn26383/vim-vue'

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': './install.sh',
      \ }

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

"Set theme
"colorscheme gruvbox
"colorscheme onedark
colorscheme xcodedarkhc
"set background=dark

" ALE
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='.phpcs.xml'
let g:ale_php_phpmd_ruleset='phpmd.xml'

function! FindConfig(prefix, what, where)
  let cfg = findfile(a:what, escape(a:where, ' ') . ';')
  return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType php let b:ale_php_phpcs_standard =
      \ get(g:, 'ale_php_phpcs_standard', '') .
      \ FindConfig('-c', '.phpcs.xml', expand('<afile>:p:h', 1))


let g:ale_javascript_eslint_suppress_missing_config = 0

" Dont forget to install packages.
" npm i -g eslint
" npm i -D prettier eslint-plugin-prettier eslint-config-prettier

let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_linter_aliases = {}
let g:ale_open_list = 0
let g:ale_set_highlights = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_warn_about_trailing_whitespace = 1

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'
let g:ale_linters = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['eslint'],
      \ 'python': ['pylint'],
      \ 'php': ['phpcs']
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
      \ }
let g:ale_fix_on_save = 1

" Deoplete
" Commented out to remove autocompletion.
 let g:deoplete#enable_at_startup = 0
 let g:deoplete#auto_complete_delay = 1
