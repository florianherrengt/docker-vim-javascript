execute pathogen#infect()
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
set nocompatible
filetype plugin on
filetype indent on
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Ignore case of searches
set ignorecase
set wildignorecase
" Enable mouse in all modes
set mouse=a

" size of a hard tabstop
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec="/usr/bin/eslint"
let g:jsx_ext_required = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "!level":  "errors" }


" indentation
let g:indent_guides_auto_colors = 0

autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" easymotion
nmap s <Plug>(easymotion-s2)

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
