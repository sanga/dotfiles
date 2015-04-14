set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'Lokaltog/powerline'
Bundle 'klen/python-mode'
Bundle 'flazz/vim-colorschemes'
Bundle 'pangloss/vim-javascript'
Bundle 'https://github.com/wincent/Command-T'
let g:CommandTCancelMap = "<Esc>"
Bundle 'rbgrouleff/bclose.vim'
Bundle 'fholgado/minibufexpl.vim'
call vundle#end()            " required

filetype plugin indent on

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
let g:pymode_folding = 0

syntax on

set hlsearch
set backspace=eol,start,indent
set incsearch
set hidden

colorscheme fruity
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
