set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

set background=dark
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" solarized options (for iterm2 on mac)
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16

set relativenumber
set number

Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'klen/python-mode'
Bundle 'jremmen/vim-ripgrep'
Bundle 'pangloss/vim-javascript'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'vim-syntastic/syntastic'
Bundle 'Yggdroot/indentLine'
let g:CommandTCancelMap = "<Esc>"
call vundle#end()            " required

" plugins I've had previously:
" Plugin 'auto-pairs'
" Plugin 'matchit.zip'
" Plugin 'python.vim'
" Plugin 'pythoncomplete'
" Plugin 'rust.vim'
" Plugin 'tagbar'
" Plugin 'vim-bufferline'
" Plugin 'vim-css3-syntax'
" Plugin 'vim-coloresque'
" Plugin 'vim-colors'
" Plugin 'vim-colors-solarized'
" Plugin 'vim-easymotion'
" Plugin 'vim-json'
" Plugin 'vim-markdown'
" Plugin 'vim-yaml'
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

" Don't autofold code
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
