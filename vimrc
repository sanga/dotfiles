set nocompatible
filetype off

" solarized options (for iterm2 on mac)
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16

set relativenumber
set number

set background=dark
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'gavocanov/vim-js-indent'
Plug 'klen/python-mode'
Plug 'jremmen/vim-ripgrep'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'rbgrouleff/bclose.vim'
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'Yggdroot/indentLine'
" plugins I've had previously:
" Plug 'auto-pairs'
" Plug 'matchit.zip'
" Plug 'python.vim'
" Plug 'pythoncomplete'
" Plug 'rust.vim'
" Plug 'tagbar'
" Plug 'vim-bufferline'
" Plug 'vim-css3-syntax'
" Plug 'vim-coloresque'
" Plug 'vim-colors'
" Plug 'vim-colors-solarized'
" Plug 'vim-easymotion'
" Plug 'vim-json'
" Plug 'vim-markdown'
" Plug 'vim-yaml'
call plug#end()

let g:CommandTCancelMap = "<Esc>"
filetype plugin indent on

let g:airline_theme='solarized'
" The rest of your config follows here

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
" Pylint configuration file
let g:pymode_lint_config = '$HOME/.pylintrc'
let g:pymode_options_max_line_length = 100
let g:pymode_lint_options_pep8 =
         \ {'max_line_length': g:pymode_options_max_line_length}
let g:syntastic_python_pylint_post_args="--max-line-length=120"
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
set rtp+=/usr/local/opt/fzf
:let mapleader = ","
map <leader>g <C-]>

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

let g:CommandTMaxFiles=50000
let g:CommandTFileScanner="git"
:map <Leader>f :CommandT<CR>
:map <Leader>d :CommandTBuffer<CR>
:map <Leader>F :CommandT %:p:h<CR>
:map <C-p> :CommandT<CR>

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 1

syntax on

set hlsearch
set backspace=eol,start,indent
set incsearch
set hidden

colorscheme solarized
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Higlight trailing whitespaces foo   
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!
highlight ExtraWhitespace ctermbg=red guibg=red  
au InsertEnter * match ExtraWhitespace /\s\+idonotcareforwhitespces$/
au InsertLeave * match ExtraWhitespace /\s\+$/ 
