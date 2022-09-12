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
set redrawtime=10000
let g:PHP_outdentphpescape = 0
set fillchars=vert:\ ,fold:\  listchars=tab:⎸\ ,nbsp:⎕
set linebreak showbreak=↪\  breakindent breakindentopt=shift:-2
set formatoptions+=nj
syntax on
set re=0
set formatprg=prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

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

set foldmethod=indent " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1


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

" ================ Cursor ========================

" Set different cursor based on insert on normal mode.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

set signcolumn=yes

" ===================== Plug Installation ====================
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'

" the path to python3 is obtained through executing `:echo exepath('python3')` in vim
let g:python3_host_prog = "/usr/local/bin/python3.10"
Plug '/usr/local/opt/fzf'

" Deoplete
if has('nvim')
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdtree'

"Theme
"Plug 'morhetz/gruvbox'
" Plug 'gosukiwi/vim-atom-dark'
" Plug 'joshdick/onedark.vim'
" let g:onedark_termcolors=256
" Plug 'arzg/vim-colors-xcode'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'sheerun/vim-polyglot'
Plug 'crusoexia/vim-monokai'


" 16-bit theme.
" Plug 'xero/sourcerer.vim'

" VSCode styled theme
" Plug 'tomasiser/vim-code-dark'

Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
"let NERDTreeShowHidden=1


" Syntax
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'
" Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
" Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'othree/yajs.vim'
" Plug 'storyn26383/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': './install.sh',
      \ }

Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Filesearch
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

call plug#end()

"Set theme
"colorscheme gruvbox
" colorscheme onedark
"colorscheme xcodedarkhc
" colorscheme palenight
" colorscheme dracula
colorscheme monokai
set background=dark

"16-bit theme
" colorscheme sourcerer

" VSCode themed
" colorscheme codedark

" set a map leader for more key combos
let mapleader = ','

" Mappings
    " shortcut to format and save
    nmap <leader>, :CocCommand prettier.formatFile <CR> :w<cr>
    if isdirectory(".git")
      " if in a git project, use :GFiles
      nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
    else
      " otherwise, use :FZF
      nmap <silent> <leader>t :FZF<cr>
    endif
      nmap <silent> <leader>s :GFiles<cr>

    " coc {{{

        let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-git',
        \ 'coc-eslint',
        \ 'coc-tslint-plugin',
        \ 'coc-pairs',
        \ 'coc-sh',
        \ 'coc-vimlsp',
        \ 'coc-prettier',
        \ 'coc-explorer',
        \ 'coc-diagnostic',
        \ 'coc-snippets'
        \ ]

        autocmd CursorHold * silent call CocActionAsync('highlight')

        " coc-prettier
        command! -nargs=0 Prettier :CocCommand prettier.formatFile
        command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

        highlight CocErrorFloat ctermfg=White guifg=#ffffff

        nmap <silent> <leader>f :CocCommand prettier.formatFile<cr>

        " coc-git
        nmap [g <Plug>(coc-git-prevchunk)
        nmap ]g <Plug>(coc-git-nextchunk)
        nmap gs <Plug>(coc-git-chunkinfo)
        nmap gu :CocCommand git.chunkUndo<cr>

        nmap <silent> <leader>k :CocCommand explorer<cr>

        "remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> gh <Plug>(coc-doHover)

        " diagnostics navigation
        nmap <silent> [c <Plug>(coc-diagnostic-prev)
        nmap <silent> ]c <Plug>(coc-diagnostic-next)

        " rename
        nmap <silent> <leader>rn <Plug>(coc-rename)

        " Remap keys for applying codeAction to the current line.
        nmap <leader>ac  <Plug>(coc-codeaction)

        " Remap for format selected region
        " xmap <leader>f  <Plug>(coc-format-selected)
        " nmap <leader>f  <Plug>(coc-format-selected)

        " organize imports
        command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            else
                call CocAction('doHover')
            endif
        endfunction

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        imap <C-l> <Plug>(coc-snippets-expand)

        inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ CheckBackSpace() ? "\<TAB>" :
        \ coc#refresh()

        function! CheckBackSpace() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        let g:coc_snippet_next = '<C-j>'
