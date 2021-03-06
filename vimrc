"General{{{
set number
set numberwidth=2

let mapleader=","

syntax enable

filetype plugin on
filetype indent on

set autoread

set autoindent
set ignorecase
"}}}

"Plugins{{{

"Pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()

"Rainbow Parentheses https://github.com/kien/rainbow_parentheses.vim
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
autocmd Syntax * RainbowParenthesesLoadChevrons

"Fireplace https://github.com/tpope/vim-fireplace

"}}}

"Tab Stuff {{{
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
"}}}

"Key Mappings {{{
"jk to exit insert mode
inoremap jk <esc>

"Copy filename to unamed register
nnoremap <leader>cf :let @" = expand("%")<cr>

"Selected word is changed to all uppercase
nnoremap <leader>u viwU<esc>e

"Edit and Source the vimrc file (for making changes quickly)
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Open file through explorer
nnoremap <leader>o :browse confirm e<cr>

"Paste from windows clipboard
nnoremap <leader>p "+gp
nnoremap <leader>P "+gP

"Remove search highlighting
nnoremap <leader>cl :nohl<cr>

"surround with quotes
nnoremap <leader>" viw<esc>`<i"<esc>`>la"<esc>
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>

"}}}

"Theme Stuff {{{

"Solarized https://github.com/altercation/vim-colors-solarized
set background=dark
colorscheme solarized

set gfn=Courier_New:h12
set guioptions-=T
set guioptions-=r
set go-=L
"}}}

"File location/backup {{{

if isdirectory("~/.vim/backup")
    set backup
    set backupdir=~/.vim/backup
elseif isdirectory("~/vimfiles/backup")
    set backup
    set backupdir=~/vimfiles/backup
endif

if isdirectory("~/.vim/tmp")
    set directory=~/.vim/tmp
elseif isdirectory("~/vimfiles/tmp")
    set directory=~/vimfiles/tmp
endif

"}}}

"Status Line {{{
"Show the status all the time
set laststatus=2
"Display the path to the file on the left
set statusline=%F
"Display the filetype
set statusline+=\ %y
"Shift to the right
set statusline+=%=
"Display the current line / total lines
set statusline+=%04l/%04L
"Display the percentage through the file
set statusline+=\ %p%%
"}}}

"Operator pending Mappings{{{
"Operator pending in next/previous parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>

"Operator pending in next/previous curly brackets
onoremap in{ :<c-u>normal! vi{
"}}}

"Filetype Behavior{{{

"Java files {{{
augroup filetype_java
    autocmd!
    "Comment/Uncomment
    autocmd FileType java nnoremap <buffer> <leader>c 0i//<esc>:s/^\/\/\/\///e<cr>
augroup END
"}}}

"Javascript files {{{
augroup filetype_javascript
    autocmd!
    "Comment/Uncomment
    autocmd FileType javascript nnoremap <buffer> <leader>c 0i//<esc>:s/^\/\/\/\///e<cr>
augroup END
"}}}

"Python files {{{
augroup filetype_python
    autocmd!
    "Comment/Uncomment
    autocmd FileType python nnoremap <buffer> <leader>c 0i#<esc>:s/^##//e<cr>
augroup END
"}}}

"Vimscript files {{{
augroup filetype_vim
    autocmd!
    "Comment/Uncomment
    autocmd FileType vim nnoremap <buffer> <leader>c 0i"<esc>:s/^""//e<cr>
    "Allow folding with triple open and close curly braces
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END
"}}}
"}}}
